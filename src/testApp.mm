#include "testApp.h"
#include "MyGuiView.h"

MyGuiView * myGuiViewController;


#define ACCELEROMETER_FORCE		0.2

//--------------------------------------------------------------
void testApp::setup(){	
	// register touch events
	ofRegisterTouchEvents(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	

	hello.setup();
	mello.setup();
	tooltip.setup();
	
	//someFont.loadFont("04B_03__.TTF", 6, false, false);
	
	vx = 10;
	vy = 10;
	l = 120;
	
	
	mello.pos.x = 160;
	
	r = mello.pos.x;
	g = mello.pos.x;
	b = mello.pos.x;
	
	ofBackground(numPoints*10, numPoints*10, numPoints*10);
	
//	r = 200;
//	g = 0;
//	b = 0;
	
	screenW = ofGetScreenWidth();
	screenH = ofGetScreenHeight();
	
	
	///old app
	lengthRatio	= 0.5;
	numPoints	= 5;
	bFill		= true;
	
	//Our Gui setup
	myGuiViewController	= [[MyGuiView alloc] initWithNibName:@"MyGuiView" bundle:nil];
	[ofxiPhoneGetUIWindow() addSubview:myGuiViewController.view];
	
//	myGuiViewController.view.hidden = YES;
	
	
	CGSize s = [[[UIApplication sharedApplication] keyWindow] bounds].size;
	screenW = ofGetWidth();
	screenH = ofGetHeight();
	NSString *filex;
	if(screenW > 480.0f){
		filex = @"Default-Portrait.png";	
	} else {
		filex = @"Default.png";
	}
	UIImageView *splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, screenW, screenH)];
	splashView.image = [UIImage imageNamed:filex];
	[[[UIApplication sharedApplication] keyWindow] addSubview:splashView];
	[[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:splashView];
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDelay:1];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:[[UIApplication sharedApplication] keyWindow] cache:YES];
	[UIView setAnimationDelegate:[UIApplication sharedApplication]]; 
	[UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];
	splashView.alpha = 0.0;
	[UIView commitAnimations];
	
	[UIApplication sharedApplication].idleTimerDisabled = YES;
	
	shouldITakeScreenshot=false;
	
	
}

//--------------------------------------------------------------
void testApp::update(){
	
	cout<<ofxAccelerometer.getForce().y<<endl;
	cout<<ofxAccelerometer.getForce().x<<endl;

	
	if (vx == 1){
		for (int i = 0; i < pts.size(); i++){
//			pts[i].x += ofRandom(-1.25, 1.25);
//			pts[i].y += ofRandom(-1.25, 1.25);
			pts[i].y += 40*(0.5+ofxAccelerometer.getForce().y);
			pts[i].x += 40*(-ofxAccelerometer.getForce().x);
			
		}
	}
	
	else {
		for (int i = 0; i < pts.size(); i++){
//			pts[i].x += ofRandom(-1.25, 1.25);
//			pts[i].y += ofRandom(-1.25, 1.25);
			
			pts[i].y += sin(ofGetElapsedTimef()) * vy;
			pts[i].x += cos(ofGetElapsedTimef()) * vx;
		}
	}

	
	if (vx == 1){
		for (int i = 0; i < particles.size(); i++){
			particles[i].update();
			particles[i].pos.y += 40*(0.5+ofxAccelerometer.getForce().y);
			particles[i].pos.x += 40*(-ofxAccelerometer.getForce().x);
			
		}
	}
	
	else {
			for (int i = 0; i < particles.size(); i++){
				particles[i].update();
				particles[i].pos.y += sin(ofGetElapsedTimef()) * vy;
				particles[i].pos.x += cos(ofGetElapsedTimef()) * vx;
				
				if (particles.size() > 300){
					particles.erase(particles.begin());
				}
				
			}
	}

	
	
	
	
	followPt.x = 0.96f * followPt.x + 0.04 * mouseX;
	followPt.y = 0.96f * followPt.y + 0.04 * mouseY;
	
	
	///SLIDERS
	
	if (mello.mVisible){
		
		r = mello.pos.x;
		g = mello.pos.x;
		b = mello.pos.x;
		
	}
	
	if(mello.pos.x > 290) {
		mello.pos.x = 290;
	}
	
	if(mello.pos.x < 30) {
		mello.pos.x = 30;
	}
	
	ofBackground(numPoints*10, numPoints*10, numPoints*10);
	
	tooltip.r = r;
	tooltip.g = g;
	tooltip.b = b;
	
	if(shouldITakeScreenshot){
		
		ofxiPhoneAppDelegate * delegate = ofxiPhoneGetAppDelegate();
		ofxiPhoneScreenGrab(delegate);
		
		
		
	}
	
	shouldITakeScreenshot=false;

}

//--------------------------------------------------------------
void testApp::draw(){
	
//	ofColor(255,0,0);
//	ofLine(ofGetWidth()/2, ofGetHeight()/2, mouseX, mouseY);
//	
//	ofEnableSmoothing();
//	ofCircle(mouseX,mouseY,50);
	
	//if (ofGetScreenWidth()>320){
	//glScalef(2.0,2.0,0);
	
//	cout<<ofGetWidth()<<endl;
	
	
	//line joining the circle
//	ofNoFill();
//	ofBeginShape();
//	//ofSetColor(r-100, g-100, b-100);
//	for (int i = 0; i < pts.size(); i++){
//		ofVertex(pts[i].x, pts[i].y);
//	}
	
//	ofEndShape();
	
	for (int i = 0; i < pts.size(); i++){
		ofCircle(pts[i].x, pts[i].y, (pts[i].y)*0.15);
		ofSetColor(((pts[i].y)+numPoints*10), ((pts[i].y-numPoints*10)), numPoints*10);
		ofFill();
		
	}
	
	//OF Particles
	
	ofFill();
	ofSetColor(numPoints*10, numPoints*10/2, numPoints*10);
	ofBeginShape();
	for (int i = 0; i < particles.size(); i++){
		ofCircle(particles[i].pos.x, particles[i].pos.y, 8);
	}
	ofEndShape();
	
	
	ofBeginShape();
	ofNoFill();
	ofSetColor(numPoints*10, numPoints*10-100, numPoints*10);
	for (int i = 0; i < particles.size(); i++){
		ofVertex(particles[i].pos.x, particles[i].pos.y);
	}
	ofEndShape();
	
	
	for (int i = 0; i < particles.size(); i++){
		particles[i].pos.x += ofRandom(-5, 5);
		particles[i].pos.y += ofRandom(-5, 5);
	}
	
	
	hello.draw();
	mello.draw();
	
	shouldITakeScreenshot=false;

}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){
	
	ofPoint myPt;
	myPt.x = touch.x;
	myPt.y = touch.y;
	pts.push_back(myPt);
	
	
//	if (hello.bVisible == true) {
//		
//		if(touch.x>0 && touch.x<ofGetWidth() && touch.y>ofGetHeight()-100 && touch.y<ofGetHeight()+100)
//		{	
//			string sktchlink="http://itunes.apple.com/gb/artist/creativeapplications-net/id369434239";
//			[[UIApplication sharedApplication] openURL:[NSURL URLWithString: [[[[NSString alloc] initWithCString: sktchlink.c_str()]stringByAddingPercentEscapesUsingEncoding: NSASCIIStringEncoding] autorelease]   ]];
//		}
//
//	}

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){

	ofPoint myPt;
	myPt.x = touch.x;
	myPt.y = touch.y;
	pts.push_back(myPt);

	
	
	//	float dx = x - followPt.x;
	//	float dy = y - followPt.y;
	
	
	///particle bits
	for (int i = 0; i < 5; i++){
		particle tempParticle;
		tempParticle.pos.set(touch.x,touch.y);
		tempParticle.vel.set( ofRandom(-1,1), ofRandom(-1,1));
		//	tempParticle.vel.set( dx/80.0, dy/80.0);
		
		particles.push_back(tempParticle);
	}
	
	
	//SLIDERS
	
	
	mello.touchMoved(touch.x, 250, 0);
	
		
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){
	
	//IF THE VIEW IS HIDDEN LETS BRING IT BACK!
	if( myGuiViewController.view.hidden ){
		myGuiViewController.view.hidden = NO;
	}
	
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}

