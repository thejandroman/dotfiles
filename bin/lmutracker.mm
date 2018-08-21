// lmutracker.mm
//
// Print the MBP's ambient light sensor reading.
//
// Copied from
// https://matthewbilyeu.com/blog/2018-04-09/setting-emacs-theme-based-on-ambient-light
// and
// https://stackoverflow.com/questions/17625495/how-do-you-programmatically-access-the-ambient-light-sensor-on-mac-os-x-10-5/18614019#18614019
//
// clang -o lmutracker lmutracker.mm -framework IOKit -framework CoreFoundation

#include <mach/mach.h>
#import <IOKit/IOKitLib.h>
#import <CoreFoundation/CoreFoundation.h>

static double updateInterval = 0.1;
static io_connect_t dataPort = 0;

void updateTimerCallBack(CFRunLoopTimerRef timer, void *info) {
  kern_return_t kr;
  uint32_t outputs = 2;
  uint64_t values[outputs];

  kr = IOConnectCallMethod(dataPort, 0, nil, 0, nil, 0, values, &outputs, nil, 0);
  if (kr == KERN_SUCCESS) {
    printf("%8lld", values[0]);
    exit(0);
  }

  if (kr == kIOReturnBusy) {
    return;
  }

  mach_error("I/O Kit error", kr);
  exit(kr);
}

int main(void) {
  kern_return_t kr;
  io_service_t serviceObject;
  CFRunLoopTimerRef updateTimer;

  serviceObject = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("AppleLMUController"));
  if (!serviceObject) {
    fprintf(stderr, "failed to find ambient light sensors\n");
    exit(1);
  }

  kr = IOServiceOpen(serviceObject, mach_task_self(), 0, &dataPort);
  IOObjectRelease(serviceObject);
  if (kr != KERN_SUCCESS) {
    mach_error("IOServiceOpen:", kr);
    exit(kr);
  }

  setbuf(stdout, NULL);

  updateTimer = CFRunLoopTimerCreate(kCFAllocatorDefault,
                                     CFAbsoluteTimeGetCurrent() + updateInterval, updateInterval,
                                     0, 0, updateTimerCallBack, NULL);
  CFRunLoopAddTimer(CFRunLoopGetCurrent(), updateTimer, kCFRunLoopDefaultMode);
  CFRunLoopRun();

  exit(0);
}
