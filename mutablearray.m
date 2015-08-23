#import <Foundation/Foundation.h>

// In cs193p Paul Hegerty wrote something interested that was corrected
// by a student, but he stated this could have worked. Wanted to understand
// if NSMutableArray would give me free access to whichever slot of array,
// even the non-existing ones.

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
