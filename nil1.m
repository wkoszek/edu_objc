#import <Foundation/Foundation.h>

int
main()
{
	NSObject *obj, *retObj;

	obj = nil;

	retObj = [obj Russell:@"I am your only friend"];

	NSLog(@"retObj: %@", retObj);
}
