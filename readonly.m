#import <Foundation/Foundation.h>

@interface Animal : NSObject
- (instancetype) init;
@property (readonly) NSNumber *length;
@end

@implementation Animal
- (instancetype) init {
	self = [super init];
	if (self) {
		_length = @(123);
	}
	return self;
}

@end

int
main()
{
	@autoreleasepool {
		Animal *animal = [Animal new];
	
		NSLog(@"length: %@", animal.length);
		
	}
}
