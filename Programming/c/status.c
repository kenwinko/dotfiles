#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/statvfs.h>
#include <sys/sysinfo.h>
#include <time.h>


// constants
#define PERCENT_SIZE 4
#define MAX_AVAIL_LEN 5
#define DATE_TEXT_LEN 25

int read_top(char *source) {
	FILE *file;
	file = fopen(source, "r");
	if (file == NULL) {
		perror("could not open mount point");
		return -1;
	}
	int battery;
	fscanf(file, "%d", &battery);
	fclose(file);
	return battery;
}

int free_space(char *mount_point) {
	struct statvfs stat;
	statvfs(mount_point, &stat);
	return (stat.f_bsize * stat.f_bavail) / (1024 * 1024 * 1024);
}

float ram_usage() {
	struct sysinfo info;
	if (sysinfo(&info) != 0) {
		perror("could not grab sysinfo");
		return -1;
	}
	float used = info.totalram - info.freeram;
	return  used / (float) info.totalram * 100;
}

void get_datetime(char time_text[DATE_TEXT_LEN]) {
	time_t t;
	time(&t);

	struct tm *tm_info;
	tm_info = localtime(&t);
	snprintf(time_text, DATE_TEXT_LEN, "%s", asctime(tm_info));
}

int main(int argc, char *argv[]) {
	
	for (;;) {
		int battery0 = read_top("/sys/class/power_supply/BAT0/capacity");
		int battery1 = read_top("/sys/class/power_supply/BAT1/capacity");
        int avail_root_gb = free_space("/");
		int avail_home_gb = free_space("/home");
		int avail_windows_gb = free_space("/windows");
		
		char date_text[DATE_TEXT_LEN];
		get_datetime(date_text);

		int ram = ram_usage();
		char cmd[256];
		snprintf(cmd, sizeof(cmd),
				"xsetroot -name '/ %dGB /home %dGB /windows %dGB | RAM: %d%% | BAT0: %d%% BAT1: %d%% | %s'",
                avail_root_gb, avail_home_gb, avail_windows_gb, ram, battery0, battery1, date_text); 
		system(cmd);	
		sleep(15);
	}
	return 0;
}
