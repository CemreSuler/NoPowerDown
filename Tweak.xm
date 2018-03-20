

%hook SBPowerDownController
static BOOL NPDenabled = YES; //default
static NSString* TitleText = nil;
static NSString* BodyText = nil;
static NSString* CancelButton = @"Cancel";



static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.chmbr.NoPowerDownPrefs.plist"];
    if(prefs)
    {
        NPDenabled = ( [prefs objectForKey:@"EnabledSwitch"] ? [[prefs objectForKey:@"EnabledSwitch"] boolValue] : NPDenabled );
        TitleText = ( [prefs objectForKey:@"TitleT"] ? [prefs objectForKey:@"TitleT"] : TitleText );
        BodyText = ( [prefs objectForKey:@"BodyT"] ? [prefs objectForKey:@"BodyT"] : BodyText );
        CancelButton = ( [prefs objectForKey:@"CancelT"] ? [prefs objectForKey:@"CancelT"] : CancelButton );
        [TitleText retain];
        [BodyText retain];
        [CancelButton retain];
    }
    [prefs release];
}

-(void)orderFront {
    loadPrefs();
  if(NPDenabled) {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:TitleText
    message:BodyText
    delegate:self
    cancelButtonTitle:CancelButton
    otherButtonTitles:nil];

    [alert show];
}  else {
  %orig;
}

}

%end
