/*
 *  slider.h
 *  prtcliPhone
 *
 *  Created by Filip Visnjic on 14/03/2010.
 *  Copyright 2010 University for the Creative Arts. All rights reserved.
 *
 */
#ifndef _SLIDER_H
#define _SLIDER_H


#include "ofMain.h"
#include "ofxMultiTouch.h"

class Slider{
	
public: 
	
	void setup();
	void update();
	void draw();
	void touchDown(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
	void touchMoved(float x, float y, int touchId, ofxMultiTouchCustomData *data = NULL);
	bool mVisible;
	
	float r;
	float g;
	float b;
	
	
	ofPoint pos;
};

#endif