#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include <pthread.h>
#include <string.h>
#include <sys/ioctl.h>

#define FALSE 0
#define TRUE 1

// Commands
char inputPinCmd[] = {'p','i','n','\r','\n'};
char cancelPinCmd[] = {'c','a','n','c','e','l','\r','\n'};
//char inputPinCmd[] = { "\r\npin\r\n" };

// Default Timeout	
int timeout = 30;

// Device-Filedescriptor
int device;

// Generate interprocess lock-var for device
volatile int DEVICESTOP = FALSE; 
volatile int TIMEOUT = FALSE; 
volatile int EXIT = FALSE; 

// True while no signal received
int wait_flag = TRUE;

// Backup port settings
struct termios portSettings;

// Create device-Mutex
pthread_mutex_t deviceMutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t timeoutMutex = PTHREAD_MUTEX_INITIALIZER;



void signal_handler_IO (int status)
{
		// Define signal handler (Needed for device-communication)
  	wait_flag = FALSE;
}

void printPortSettings(struct termios settings)
{
  printf("c_cflag: %i\n", settings.c_cflag);
  printf("c_iflag: %i\n", settings.c_iflag);
  printf("c_oflag: %i\n", settings.c_oflag);
  printf("c_lflag: %i\n", settings.c_lflag);
  printf("c_cc[VMIN]: %i\n", settings.c_cc[VMIN]);
  printf("c_cc[VTIME]: %i\n", settings.c_cc[VTIME]);
  printf("c_ispeed: %i\n", settings.c_ispeed);
  printf("c_ospeed: %i\n", settings.c_ospeed);
}

struct termios initialize_device(char *deviceName) {
    struct termios newtio;
    struct sigaction saio;   
    
    // Open communication to device
    device = open(deviceName, O_RDWR | O_NOCTTY | O_NONBLOCK);
    if(device < 0) {
        printf("Can't open device '%s'\n", deviceName);
        exit(-1);
    }
    
    // Install/Start the signal handler
    saio.sa_handler = signal_handler_IO;
    //saio.sa_mask = 0;
    sigemptyset(&saio.sa_mask);
    saio.sa_flags = 0;
    saio.sa_restorer = NULL;
    sigaction(SIGIO,&saio,NULL);
    
    // Allow the signal handler process to receive SIGIO
    fcntl(device, F_SETOWN, getpid());
    
    // Make the signal handler asynchronous
    fcntl(device, F_SETFL, FASYNC);
    
    // Save  current port settings
    tcgetattr(device, &portSettings);
 
		//printf("\r\nOld Settings:\r\n"); 
		//printPortSettings(portSettings);  
	
		// Set new port settings
    newtio.c_cflag = 3263;
    newtio.c_iflag = 0;
    newtio.c_oflag = 4;
    newtio.c_lflag = 2608;
    newtio.c_cc[VMIN]= 1;
    newtio.c_cc[VTIME]= 0;
		newtio.c_ispeed = B38400;
		newtio.c_ospeed = B38400;
		
		//printf("\r\nNew Settings:\r\n"); 
		//printPortSettings(newtio);  

    tcflush(device, TCIFLUSH);
    tcsetattr(device,TCSAFLUSH, &newtio);
}

void *ReadFromDevice(void *args) {
    int bytesReceived;
    int bytes;
    
    char buffer[255];
    
    while(DEVICESTOP==FALSE && EXIT==FALSE) {
        usleep(200000);
        
        if (wait_flag==FALSE) { 
            // Flush Buffer
            memset(buffer, 0, sizeof(buffer));
            
            // Lock Device for reading
            pthread_mutex_lock (&deviceMutex);

            // Get byte-Count in buffer before make a blocking read-call
            ioctl(device, 0x541B, &bytes);
            
            if(bytes > 0) { 
                bytesReceived = read(device, buffer, 255);

						//printf("\r\n Received (%d Bytes): %s\r\n", bytesReceived, buffer);
                
                // Stop loop if only a CR is received 
                if (bytesReceived <= 0) {
                        DEVICESTOP=TRUE;
                        printf("Error: Can't read from device\n");
                }else {
									printf("%s", buffer);
            			pthread_mutex_unlock (&deviceMutex);
									EXIT = TRUE;
    							pthread_exit(NULL);
								}
            }
            
            pthread_mutex_unlock (&deviceMutex);
           
            // Wait for new Input
            wait_flag = TRUE;
          }
    }
    
    pthread_exit(NULL);
}

void *CheckTimeout(void *args) {
	if(timeout > 0) {
		for(int i=0;i<timeout;i++){
			sleep(1);
			
			if(EXIT==TRUE)
       	pthread_exit(NULL);
		}

    pthread_mutex_lock (&deviceMutex);
    write(device, cancelPinCmd, strlen(cancelPinCmd));
    pthread_mutex_unlock(&deviceMutex);

		EXIT = TRUE;
		printf("timeout\r\n");
	}

	pthread_exit(NULL);
}

void printascii(char *msg, int len){
	int i;
	for(i=0;i<len;i++) {
		int c = (int) *(msg + i);
		printf("%i ", c);
	}
}

int main(int argc, char *argv[])
{
	if(argc > 2 && strlen(argv[2]) > 0)
		timeout = atoi(argv[2]);

	// Open device
	initialize_device(argv[1]);

	// Send Input-Pin Command
  pthread_mutex_lock (&deviceMutex);
  write(device, inputPinCmd, strlen(inputPinCmd));
  pthread_mutex_unlock(&deviceMutex);

	  // Create Timeout-Thread
  pthread_t TimeoutThread;
  pthread_create(&TimeoutThread, NULL, CheckTimeout, NULL);
 
	// read from device
	pthread_t ReadDeviceThread;
  pthread_create(&ReadDeviceThread, NULL, ReadFromDevice, NULL);

	// Wait for Threads 
  pthread_join(ReadDeviceThread, NULL);	
  pthread_join(TimeoutThread, NULL);

	// Reset device-settings
	pthread_mutex_lock (&deviceMutex);
	tcflush(device, TCIFLUSH);
  tcsetattr(device,TCSAFLUSH, &portSettings);
  pthread_mutex_unlock (&deviceMutex);

	// Delete Mutex
	pthread_mutex_destroy(&deviceMutex);
	pthread_mutex_destroy(&timeoutMutex);

	return 0;
}
