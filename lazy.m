#import <Foundation/Foundation.h>

@interface Animal : NSObject
- (instancetype) init;
@property (assign) NSString *name;
@property (assign) NSNumber *length;
@property (assign) NSNumber *weight;
@property (assign) NSMutableString *cpyName;
@property (assign) NSNumber *cpyLength;
@property (assign) NSNumber *cpyWeight;
@property (assign,getter=howOld) int age;
@end

@implementation Animal

@synthesize name = accName;
@synthesize length = accLength;
@synthesize weight = accWeight;

- (instancetype) init {
	self = [super init];
	if (self) {
		self.age = 0;
	}
	return self;
}

- (void)setName:(NSString *) name
{
	accName = name;
	if (!_cpyName) {
		_cpyName = [NSMutableString stringWithString:name];
	}
}
- (NSString *)name
{
	return accName;
}

- (void)setLength:(NSNumber *)number
{
	accLength = number;
	if (!_cpyLength) {
		_cpyLength = [[NSNumber alloc] initWithInt:[number intValue]];
	}
}
- (NSNumber *)length
{
	return accLength;
}

- (void)setWeight:(NSNumber *)number
{
	accWeight = number;
	if (!_cpyWeight) {
		_cpyWeight = [[NSNumber alloc] initWithInt:[number intValue]];
	}
}
- (NSNumber *)weight
{
	return accWeight;
}

- (void)dump
{
	NSLog(@"=== age:%d ===", self.age);
	NSLog(@"name=%@ length=%@ weight=%@", self.name, self.length, self.weight);
	NSLog(@"copies:");
	NSLog(@"name=%@ length=%@ weight=%@", self.cpyName, self.cpyLength, self.cpyWeight);
}

@end

int
main()
{
	@autoreleasepool {
		int	age;

		Animal *animal = [Animal new];
		[animal setName:@"bug"];
		[animal setWeight: @(1)];
		[animal setLength: @(4)];
		age = [animal howOld];
		[animal dump];

		[animal setName:@"mammal"];
		[animal setWeight: @(3)];
		[animal setLength: @(5)];
		[animal dump];
	}
}
