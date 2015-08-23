#import <Foundation/Foundation.h>

@protocol DeviceInfo

@required
- (int)batteryLevel;

@optional
- (int)isBluetoothOn;
- (int)bozoLevel;
@end

//-----------------------------------
@interface Mac : NSObject <DeviceInfo>
- (int)batteryLevel;
@end

@implementation Mac
- (int)batteryLevel
{
	return arc4random() % 10;
}

#ifdef BOZO
- (int) bozoLevel
{
	return 13;
}
#endif
@end

//-----------------------------------
@interface Phone : NSObject <DeviceInfo>
- (int)batteryLevel;
@end

@implementation Phone
- (int)batteryLevel
{
	return arc4random() % 10;
}

@end

int
main(int argc, char **argv)
{
	Mac	*mac = [Mac new];
	Phone	*phone = [Phone new];

	(void)argc;
	(void)argv;

	NSLog(@"Mac level   : %d", [mac batteryLevel]);
	NSLog(@"iPhone level: %d", [phone batteryLevel]);

	if ([mac respondsToSelector:@selector(bozoLevel)]) {
		NSLog(@"Mac bozoLevel   : %d", [mac bozoLevel]);
	}
	if ([phone respondsToSelector:@selector(bozoLevel)]) {
		NSLog(@"iPhone bozoLevel: %d", [phone bozoLevel]);
	}

	return 0;
}
