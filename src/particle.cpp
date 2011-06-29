/*
 *  particle.cpp
 *  particleExample
 *
 *  Created by Zach Lieberman on 2/27/10.
 *  Copyright 2010 __MyCompanyName__. All rights reserved.
 *
 */

#include "particle.h"

//zachs code
particle::particle(){

	life=0;
}

void particle::update(){
	pos.x += vel.x;
	pos.y += vel.y;
	vel.x *= 0.59;
	vel.y *= 0.59;
	
	
	life++;  // zachs code
}

void particle::draw(){
	
//	ofFill();
//	ofSetColor((ofRandom(0, 255)), (ofRandom(0, 255)), (ofRandom(0, 255)), 50);
	ofCircle(pos.x, pos.y, 10);
		
}
