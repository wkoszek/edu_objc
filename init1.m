#import <Foundation/Foundation.h>

@interface Box : NSObject

@property NSUInteger w;
@property NSUInteger h;

- (id) init;
- (id) initWithW:(int)w setH:(int)h;

@end

@implementation Box
-(id) init {
	self = super.init;
	if (self) {
		NSLog(@"%s called", __func__);
		self.w = 0;
		self.h = 0;
		return self;
	}
	return self;
}

-(id) initWithW:(int)w setH:(int)h
{
	self = super.init;
	if (self) {
		NSLog(@"%s called", __func__);
		self.w = w;
		self.h = h;
	}
	return self;
}
@end

int
main(int argc, char **argv)
{
	Box *b1, *b2;

	(void)argc;
	(void)argv;

	NSLog(@"-----");
	b1 = [[Box alloc] init];

	NSLog(@"-----");
	b2 = [[Box alloc] initWithW:10 setH:2];

	(void)b1;
	(void)b2;
	return 0;
}
