//
//  ITVPNode.m
//  iTVP
//
//  Created by Alexander on 25/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ITVPNode.h"


@implementation ITVPNode

@synthesize ident, findable, name, description, latitude, longitude, address;

-(id) initWithId: (int) aIdent withState: (bool) isFindable 
		withName: (NSString *) aName withDescription: (NSString *) aDescription 
	withLatitude: (double) aLatitude withLongitude: (double) aLongitude{
	
	self.ident = aIdent;
	self.findable = isFindable;
	self.name = aName;
	self.description = aDescription;
	self.latitude = aLatitude;
	self.longitude = aLongitude;

	return self;
}

@end
