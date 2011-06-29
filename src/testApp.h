#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "particle.h"

#include "about.h"
#include "slider.h"
#include "tooltip.h"

#define NUM_PTS 500

class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
	
	
	vector < ofPoint > pts;
	
	ofPoint followPt;
		
	vector < particle > particles;
	
	About hello;
	Slider mello;
	
	Tooltip tooltip;
	
	float r;
	float g;
	float b;
	
	float vx;
	float vy;
	float l;
	
	float screenW;
	float screenH;
	
	float lengthRatio;
	int numPoints;
	bool bFill;
	
	bool shouldITakeScreenshot;
	

};


