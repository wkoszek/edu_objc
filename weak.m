#import <Foundation/Foundation.h>

@interface Film : NSObject
@property (assign) NSString *name;
@property (weak) NSString *wname;
- (void)dealloc;
@end

@implementation Film
- (void)dealloc
{
	NSLog(@"dealloc");
}
@end

int
main()
{
	@autoreleasepool {
		NSString * __weak origName;

		Film *film = [Film new];

		film.name = @"original name";
		origName = film.name;
		film.name = @"new name";
		NSLog(@"orig:'%@' new:'%@'", origName, film.name);
	
		film.wname = @"original name2";
		origName = film.wname;
		film.wname = nil;
		film.wname = @"new name2";
		NSLog(@"orig:'%@' new:'%@'", origName, film.wname);
	}
}
