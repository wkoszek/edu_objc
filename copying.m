#import <Foundation/Foundation.h>

@interface DVD : NSObject <NSCopying>
- (instancetype) init;
@property int dvdLength;
@property int dvdYear;
- (id)copyWithZone:(NSZone *)zone;
@end

@implementation DVD

- (instancetype) init
{
	self = [super init];
	if (self) {
		self.dvdLength = 0;
		self.dvdYear = 0;
	}
	return self;
}

- (instancetype) copyWithZone:(NSZone *)zone
{
	id copy = [[[self class] alloc] init];	
	if (copy) {
		[copy setDvdLength:1];
		[copy setDvdYear:2];
	}
	return copy;
}

- (NSString *) desc
{
	return [NSString stringWithFormat:@"dvd(l=%d,y=%d)", self.dvdLength, self.dvdYear];
}

@end

int
main(int argc, char **argv)
{
	DVD	*dvd = [[DVD alloc] init];
	DVD	*dvd2 = [dvd copy];

	NSLog(@"dvd  = %@", dvd.desc);
	NSLog(@"dvd2 = %@", dvd2.desc);

	return 0;
}
