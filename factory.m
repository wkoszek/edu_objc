#import <Foundation/Foundation.h>

@interface Box : NSObject

@property NSUInteger h;
@property NSUInteger w;
@property NSUInteger l;

- (id) init;
+ (id) initWithNewBox;

@end

@implementation Box
- (id) initWithHeight:(NSUInteger)h width:(NSUInteger)w length:(NSUInteger)l
{
	self = [super self];
	if (self) {
		self.h = h;
		self.w = w;
		self.l = l;
	}
	return self;
}

- (id) init {
	return [self initWithHeight:0 width:0 length:0];
}

+ (instancetype) initWithNewBox
{
	Box *b = [[Box alloc] init];

	b.h = b.w = b.l = 123;

	return b;
}

@end

int
main()
{
	Box *b = [[Box alloc] init]; 
	NSLog(@"Box b = %@: h:%lu w:%lu l:%lu", b, b.h, b.w, b.l);

	Box *b2 = [Box initWithNewBox];
	NSLog(@"Box b2 = %@: h:%lu w:%lu l:%lu", b2, b2.h, b2.w, b2.l);
}
