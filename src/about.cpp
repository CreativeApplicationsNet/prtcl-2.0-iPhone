/*
 *  about.cpp
 *  ptcleiPhone
 *
 *  Created by Filip Visnjic on 28/02/2010.
 *
 */

#include "about.h"




void About::setup(){
	bVisible = false;
	
//	someFont.loadFont("04B_03__.TTF", 6, false, false);
//	titleFont.loadFont("PixelSplitter-Bold.ttf", 10, false, false);
	
	
	r = 220;
	g = 220;
	b = 220;
	
	info.loadImage("info.png");
	infox2.loadImage("infox2.png");

}


void About::draw(){
	if (bVisible){
		ofPushStyle();
		ofSetColor(255,255,255);
		if (ofGetWidth() > 320) {
			infox2.draw(0.1, 0.1);
		}
		else {
			info.draw(0.1, 0.1);
		}
		ofPopStyle();
		
//		ofPushStyle();
//		ofFill();
//		ofEnableAlphaBlending();
//		ofSetColor(0,0,0,70);
//		ofRect(10, 10, ofGetWidth()-20, ofGetHeight()-50);
//		ofPopStyle();
//		
//		
//		ofPushStyle();
//		ofSetColor(r,g,b);
//		ofDrawBitmapString("FILIP VISNJIC 2010 // FVDA.CO.UK // CREATIVEAPPLICATIONS.NET", 30,50); 
//		ofDrawBitmapString("VER 1.0 CREATED AT THE V&A DECODE OPENFRAMEWORKS WORKSHOP\nIN LONDON 28/02/2010", 30,70);
//		ofDrawBitmapString("THANKS TO JOEL GETHIN LEWIS, ZACH LIEBERMAN, KYLE MCDONALD,\nARTURO CASTRO, ANDREAS MULLER, EDUARD PRATS MOLNER,\nZACH GAGE, ONEDOTZERO AND VICTORIA AND ALBERT MUSEUM\n", 30,110);
//		ofDrawBitmapString("CREATED WITH OPENFRAMEWORKS", 30,150);
//		ofDrawBitmapString("FOR INFORMATION ON OPENFRAMEWORKS SEE\nHTTP://OPENFRAMEWORKS.CC", 30,170);
//		ofDrawBitmapString("FOR INFORMATION ON PAST AND FUTURE WORKSHOPS SEE\nHTTP://WIKI.OPENFRAMEWORKS.CC", 30,200);
//		
//		ofDrawBitmapString("PRTCL", 30,420); //font experiments
//		ofDrawBitmapString("1.2", 80,410);
		
		
		
		ofPopStyle();

		
		
		
	}
	
	
}
