/*
 *  about.h
 *  ptcleiPhone
 *
 *  Created by Filip Visnjic on 28/02/2010.
 *
 */

#ifndef _ABOUT_H
#define _ABOUT_H

#include "ofMain.h"

class About{
	
public: 
	
	void setup();
	void draw();
	bool bVisible;
	
	ofPoint pos;
	
	
//	ofTrueTypeFont  someFont;
//	ofTrueTypeFont  titleFont;
	
	float r;
	float g;
	float b;
	
	ofImage info;
	ofImage infox2;
};

#endif