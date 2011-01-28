//
//  ITVPNode.h
//  iTVP
//
//  Created by Alexander on 25/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ITVPNode : NSObject {

	int ident;
	bool findable;
	NSString *name;
	NSString *description;
	NSString *address;
	double latitude;
	double longitude;
	

}

@property(nonatomic) int ident;
@property(nonatomic) bool findable;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *address;
@property(nonatomic, copy) NSString *description;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;

-(id) initWithId: (int) aIdent withState: (bool) isFindable 
		withName: (NSString *) aName withDescription: (NSString *) aDescription 
		withLatitude: (double) aLatitude withLongitude: (double) aLongitude;

@end
