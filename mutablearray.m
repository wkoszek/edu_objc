#import <Foundation/Foundation.h>

int
main() { @autoreleasepool {

	NSMutableArray *array = [NSMutableArray new];

	@try {
		array[1] = @(10);
	} @catch (NSException *exception) {
		NSLog(@"Exception: %@", exception);
	} @finally {
		NSLog(@"Final exception");
	}
}}
