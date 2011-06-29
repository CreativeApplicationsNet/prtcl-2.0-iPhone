//
//  MyGuiView.m
//  iPhone Empty Example
//
//  Created by theo on 26/01/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyGuiView.h"
#include "ofxiPhoneExtras.h"

@implementation UINavigationBar (Background)
- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"menubar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end

@implementation UIToolbar (Background)
- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed:@"menubar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}
@end


@implementation MyGuiView

// called automatically after the view is loaded, can be treated like the constructor or setup() of this class
-(void)viewDidLoad {
	myApp = (testApp*)ofGetAppPtr();
	
	
}

//----------------------------------------------------------------
-(void)setStatusString:(NSString *)trackStr{
	displayText.text = trackStr;
}

//----------------------------------------------------------------
-(IBAction)more:(id)sender{
	myApp->vx += 1.0;
	myApp->vy += 1.0;

			
}

//----------------------------------------------------------------
-(IBAction)less:(id)sender{
	myApp->vx -= 1.0;
	myApp->vy -= 1.0;
	
}
//----------------------------------------------------------------

-(IBAction)acc:(id)sender{
	
	myApp->vx = 1.0;
	myApp->vy = 1.0;
	myApp->l = 60.0;
		
}

-(IBAction)clear:(id)sender{
	
	myApp->pts.clear();
	myApp->particles.clear();
	
	if (myApp->hello.bVisible == true) {
		myApp->hello.bVisible = false;
	}
	
	
}

-(IBAction)info:(id)sender{
	
	
	
	if (myApp->hello.bVisible == true) {
		myApp->hello.bVisible = false;
	}
	else {
		myApp->hello.bVisible = true;
	}

		
}


//----------------------------------------------------------------
-(IBAction)hide:(id)sender{
	
	
	self.view.hidden = YES;
	
	if (myApp->hello.bVisible == true) {
		myApp->hello.bVisible = false;
	}
	
}

//----------------------------------------------------------------
-(IBAction)link:(id)sender{
	
	if (myApp->hello.bVisible == true) {
	string sktchlink="http://apps.creativeapplications.net";
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: [[[[NSString alloc] initWithCString: sktchlink.c_str()]stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding] autorelease]   ]];
	}	
	
}

//----------------------------------------------------------------
-(IBAction)takescreenshot:(id)sender{
	
	
	myApp->shouldITakeScreenshot=true;
	
}


//----------------------------------------------------------------
-(IBAction)hideonly:(id)sender{
	
	if (myApp->hello.bVisible == false) {
		self.view.hidden = YES;
	}
	
}

//----------------------------------------------------------------
-(IBAction)adjustPoints:(id)sender{
	
	UISlider * slider = sender;
	printf("slider value is - %f\n", [slider value]);
	
	myApp->numPoints = 3 + [slider value] * 28;
	
}





//----------------------------------------------------------------
//-(IBAction)fillSwitch:(id)sender{
//	
//	UISwitch * toggle = sender;
//	printf("switch value is - %i\n", [toggle isOn]);
//	
//	myApp->bFill = [toggle isOn];
//	
//	myApp->vx = 1.0;
//	myApp->vy = 1.0;
//	myApp->l = 60.0;
//	
//	
//	string statusStr = " Status: fill is " + ofToString(myApp->bFill);
//	[self setStatusString:ofxStringToNSString(statusStr)];	
//}

@end
