#include "NPDRootListController.h"

@implementation NPDRootListController
static NSString* TitleText = nil;
static NSString* BodyText = nil;
static NSString* CancelButton = @"Cancel";
static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chmbr.NoPowerDownPrefs.plist"];
    if(prefs)
    {
        TitleText = ( [prefs objectForKey:@"TitleT"] ? [prefs objectForKey:@"TitleT"] : TitleText );
        BodyText = ( [prefs objectForKey:@"BodyT"] ? [prefs objectForKey:@"BodyT"] : BodyText );
        CancelButton = ( [prefs objectForKey:@"CancelT"] ? [prefs objectForKey:@"CancelT"] : CancelButton );
        [TitleText retain];
        [BodyText retain];
        [CancelButton retain];
    }
    [prefs release];
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}
-(void)save
{
   system("killall -9 SpringBoard");
}

-(void)donate
{
	NSURL* url = [[NSURL alloc] initWithString: @"https://www.paypal.me/CemreSuler"];
[[UIApplication sharedApplication] openURL: url];
}
-(void)previewalert {
	  loadPrefs();
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:TitleText
	message:BodyText
	delegate:self
	cancelButtonTitle:CancelButton
	otherButtonTitles:nil];

	[alert show];
}
@end
