#include <Foundation/Foundation.h>
#include <mach/mach_time.h>

@interface Timing : NSObject
- (instancetype) init;
@end
@implementation Timing {
	int	array[1000];
}
- (instancetype) init
{
	self = [super init];
	return self;
}

@end

int
main()
{
	uint64_t	start, end, diff, sum;
	Timing	*lazy[1000];
	int	i;

	sum = 0;
	for (i = 0; i < sizeof(lazy)/sizeof(lazy[0]); i++) {
		start = mach_absolute_time();
		lazy[i] = [[Timing alloc] init];
		end = mach_absolute_time();
		diff = end - start;
		NSLog(@"diff: %08llx", diff);
		sum += diff;
	}
	NSLog(@"sum: %08llx sum/i=%08llx", sum, sum/i);
}
