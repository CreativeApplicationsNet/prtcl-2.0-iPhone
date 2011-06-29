/*
 *  particle.h
 *  particleExample
 *
 *  Created by Zach Lieberman on 2/27/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */


#ifndef _PARTICLE_H
#define _PARTICLE_H

#include "ofMain.h"



class particle{
	
	public: 
		
	ofPoint pos;
	ofPoint vel;
	
	void update();
	void draw();
	
	int life;
	
	particle();
	
	//ofTrueTypeFont  someFont;

	
};





#endif

