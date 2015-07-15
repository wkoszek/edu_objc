#import <Foundation/Foundation.h>

// - Made a sample class "Person". Have it inherit from NSObject
// - Made 2 properties (lowercase).
// - Observed that generated accessors are getting ObjCificated name in the
//   lowerCaseLetter format.
// - @% doesn't accept formatting string %20.20@ isn't possible.

@interface Person : NSObject

@property (assign) NSString *name;
@property int age;

-(id)init;

@end

@implementation Person

-(id) init
{
	self = [super init];
	if (self) {
		self.age = 1;
	}
	return self;
}

-(void) printWithLabel:(NSString *)label
{

	NSLog(@"\t%@\t| %@", label, self.name);
	NSLog(@"\t%@\t| age: %d", label, self.age);
}

-(void)dummy
{
	NSLog(@"dummy method");
}

-(NSObject *)dummyReturnNil
{

	return nil;
}

@end

int
main(int argc, char **argv)
{
	SEL selDummy = NSSelectorFromString(@"dummy");
	SEL selDummyRetNil = NSSelectorFromString(@"dummyReturnNil");
	NSObject *obj;
	BOOL canHandle;
	Person *person;
	
	(void)argc;
	(void)argv;

	person = [[Person alloc] init];
	[person printWithLabel:@"after init"];
	[person setName: [[[NSString alloc] initWithUTF8String: "sample"] autorelease]];
	[person setAge: 20];
	[person printWithLabel: @"after name set"];

	canHandle = [person respondsToSelector:@selector(dummy)];
	NSLog(@"canHandle selector:dummy %d", canHandle);

	canHandle = [person respondsToSelector:@selector(dummyReturnNil)];
	NSLog(@"canHandle selector:dummyRetNil %d", canHandle);

	canHandle = [person respondsToSelector:@selector(notHere)];
	NSLog(@"canHandle selector:notHere %d", canHandle);

	obj = [person performSelector: selDummy];
	if (obj) {
		NSLog(@"selDummyRetNil return: %@", obj);
	}
	obj = [person performSelector: selDummyRetNil];
	NSLog(@"selDummyRetNil return: %@", obj);

	return 0;
}
