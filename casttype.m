#import <Foundation/Foundation.h>

int
main()
{
	NSNumber	*nsnum;
	char	buf[4] = { 1, 2, 3, 4 };
	short	s;
	int	i;
	int	p;

	i = *((int *)buf);
	s = *((short *)buf);

	NSLog(@"%08x %08x\n", i, s);

	NSLog(@"Adr: %08x\n", (unsigned int)&p);
}
