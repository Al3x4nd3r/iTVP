//
//  MyAnnotation.m
//  iTVP
//
//  Created by Alexander on 27/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate;


- (id) initWithCoordinate:(CLLocationCoordinate2D)coord{
    coordinate = coord;
	return self;
}

@end
