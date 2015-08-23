#include <Foundation/Foundation.h>

@interface Device : NSObject
@property NSNumber *batteryLevel;
@property int isTesting;
- (id)init;
@end

@implementation Device
- (id) init {
	self = [super init];
	if (self) {
		self.batteryLevel = @(4);
	}
	return self;
}
@end

@interface Device (DeviceSensors)
- (int) hasWifi;
@end

@implementation Device (DeviceSensors)
- (int) hasWifi {
	int rv = arc4random() % 1;
	return self.isTesting ? 7 : rv;
}
@end

int
main()
{
	Device *dev = [Device new];

	dev.isTesting = YES;

	NSLog(@"Device battery: %@", [dev batteryLevel]);
	NSLog(@"Device hasWifi: %d", [dev hasWifi]);

	return 0;
}
