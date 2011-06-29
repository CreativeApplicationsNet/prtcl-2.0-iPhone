/*
 *  tooltip.h
 *  SKTCHiPhone
 *
 *  Created by Filip Visnjic on 18/03/2010.
 *  Copyright 2010 University for the Creative Arts. All rights reserved.
 *
 */

#ifndef _TOOLTIP_H
#define _TOOLTIP_H

#include "ofMain.h"

class Tooltip{
	
public: 
	
	void setup();
	void update();
	void draw();
	bool bVisible;
	
	float squareAlpha;
	
//	ofTrueTypeFont  someFont;
//	ofTrueTypeFont  titleFont;
	
	
	float r;
	float g;
	float b;
	
	float x;
	float y;
	
	string text;

};

#endif