//
//  DetailNodeViewController.h
//  iTVP
//
//  Created by Alexander on 25/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ITVPNode.h"


@interface DetailNodeViewController : UIViewController {
	UILabel *label;
	UIImageView *imageView;
	UITextView *textView;
	MKMapView *mapView;
	ITVPNode *node;
}

@property (nonatomic, retain) ITVPNode *node;
@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;



- (void) updateDetailView;
- (IBAction) done: (id) sender;
@end
