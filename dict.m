#import <Foundation/Foundation.h>

int
main(int argc, char **argv)
{
	NSDictionary *dict;
	NSMutableDictionary *dictCopy;

	(void)argc;
	(void)argv;

	dict = @{
		@"wojtek" : @"something",
		@"key2" : @"value2",
		@"key3" : @"key3"
	};
	dictCopy = [NSMutableDictionary dictionaryWithDictionary:dict];

	NSLog(@"dict    : %@", dict);
	NSLog(@"dictCopy: %@", dictCopy);

	return 0;
}
