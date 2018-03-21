#include <Foundation/Foundation.h>


@interface SampleStream : NSObject 
@property (nonatomic) NSObject *dummy;
@end

@interface SampleStream () {
	uint8_t writeCount:1;
	uint8_t readCount:1;
}
@end

@implementation SampleStream

- (instancetype) init {
	self = [super init];
	if (!self) {
		return self;
	}
	self->writeCount = 0;
	self->readCount = 1;
	return self;
}

- (void) dummyMethod {
	NSLog(@"writeCount: %d", self->writeCount);
	NSLog(@"readCount: %d", self->readCount);

	if (!self->writeCount || !self-readCount) {
		NSLog(@"bleh");
	}
}

@end

int
main() {
	SampleStream *b = [[SampleStream alloc] init];
	NSLog(@"%@", b);
	[b dummyMethod];
}
