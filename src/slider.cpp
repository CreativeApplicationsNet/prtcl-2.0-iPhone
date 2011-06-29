/*
 *  slider.cpp
 *  prtcliPhone
 *
 *  Created by Filip Visnjic on 14/03/2010.
 *  Copyright 2010 University for the Creative Arts. All rights reserved.
 *
 */

#include "slider.h"



void Slider::setup() {
	mVisible = false;	
	pos.set(30, 245, 0);
	
	r = 220;
	g = 220;
	b = 220;
}

void Slider::update() {
	
	if(pos.x > 290) {
		pos.x = 290;
	}
	
	if(pos.x < 30) {
		pos.x = 30;
	}
}


void Slider::draw() {
	
	if (mVisible){
	
		ofPushStyle();
		ofFill();
		ofSetColor(r,g,b);
		ofRect(pos.x, 245, 10, 10);
		ofPopStyle();
		
		
	}
}


void Slider::touchMoved(float x, float y, int touchId, ofxMultiTouchCustomData *data) {
	pos.set(x, y, 0);
}








