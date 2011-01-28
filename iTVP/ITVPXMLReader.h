//
//  ITVPXMLReader.h
//  iTVP
//
//  Created by Alexander on 27/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITVPNode.h"


@interface ITVPXMLReader : NSObject <NSXMLParserDelegate> {
	NSMutableArray *nodesList;
	ITVPNode *tempNode;
	NSString *currentElement;
	bool error;
}

@property (nonatomic, retain) NSMutableArray *nodesList;
@property (nonatomic, assign) bool error;

-(NSMutableArray*) parse: (NSString*) path;

@end
