#import <Foundation/Foundation.h>

@interface MyString : NSObject

@property int inited;
@property (assign) NSString *absoluteString;
-(id)init;

@end

@implementation MyString
-(id)init {
	self = super.init;
	if (self) {
		self.inited = 1;
		self.absoluteString = @"nothingSpecial";
	}
	return self;
}

@end

int
main()
{
	NSString *str = [[NSString alloc] initWithString: @"wojtek"];
	MyString *myStr = [[MyString alloc] init];
	MyString *myStrNil = nil; 

	NSLog(@"s\t\t:%@", str);
	NSLog(@"mystr\t\t:%@", myStr);
	NSLog(@"absoluteString\t:%@", [myStr absoluteString]);
	NSLog(@"absoluteString=nil\t:%@", [myStrNil absoluteString]);
}
