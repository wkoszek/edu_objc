#import <Foundation/Foundation.h>

#import <stdlib.h>

@interface MyObject : NSObject
+ (instancetype)factoryMethodA;
+ (id)factoryMethodB;
@end
 
@implementation MyObject
// According to Apple this is the right thing.
+ (instancetype)factoryMethodA { return [[[self class] alloc] init]; }

// This is the bad thing.
+ (id)factoryMethodB { return [[[self class] alloc] init]; }

// This is supposedly the bad thing, but seems like it's OK, since Clang
// is warning us about problems.
+ (instancetype)factoryMethodABroken { return [[MyObject alloc] init]; }
@end
 
@interface MyObjectSubclass : MyObject
@end
@implementation MyObjectSubclass
@end

int
main(int argc, char **argv)
{
#ifdef EX1
	NSUInteger x, y;

	x = [[MyObject factoryMethodA] count];
	y = [[MyObject factoryMethodB] count];
#endif

#ifdef EX2
	NSString *aString = [MyObjectSubclass factoryMethodABroken];
#endif

#ifdef EX3
	NSString *aString = [MyObjectSubclass factoryMethodA];
#endif

}
