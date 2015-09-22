#import <Foundation/Foundation.h>

@interface Film : NSObject
@property (assign) NSNumber *howManyActors;
@end

@implementation Film
- (instancetype) init
{
	self = [super init];
	if (self) {
		self.howManyActors = [NSNumber numberWithInt: 123];
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"dealloc");
}
@end

int
main(int argc, char **argv)
{
	int ai, makeNull;

	makeNull = 0;
	for (ai = 0; ai < argc; ai++) {
		if (strcmp(argv[ai], "-makenull") == 0) {
			makeNull = 1;
		}
	}
	NSLog(@"makeNull: %d", makeNull);

	@autoreleasepool {
		Film *film = [Film new];
		if (makeNull) {
			film = nil;
		}

		NSLog(@"1: film:%@ howManyActors:%@", film, [film howManyActors]);
		NSLog(@"2: film:%@ howManyActors:%@", film, film.howManyActors);
	}
}
