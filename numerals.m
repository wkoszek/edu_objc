#include <Foundation/Foundation.h>

int
main(int argc, char **argv)
{
	(void)argv;

	NSLog(@"Object: %@", @(2));
	NSLog(@"Argc: %@", @(argc));
	
	NSLog(@"-----------------------");
	NSLog(@"Argc1 : %p", @(argc));
	NSLog(@"Argc2 : %p", @(argc));
	NSLog(@"Argc3 : %p", @(argc));
	NSLog(@"Argco1: %p", [[NSNumber alloc] initWithInt:argc]);
	NSLog(@"Argco2: %p", [[NSNumber alloc] initWithInt:argc]);
	NSLog(@"Argco3: %p", [[NSNumber alloc] initWithInt:argc]);


	NSLog(@"Argco3: %p", [[NSNumber alloc] initWithInt:7]);
	NSLog(@"Argco3: %p", [[NSNumber alloc] initWithInt:13]);
	NSLog(@"Argco3: %p", [[NSNumber alloc] initWithInt:19]);
}
