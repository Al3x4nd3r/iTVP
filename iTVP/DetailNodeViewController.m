//
//  DetailNodeViewController.m
//  iTVP
//
//  Created by Alexander on 25/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailNodeViewController.h"
#import "MyAnnotation.h"


@implementation DetailNodeViewController

@synthesize label, node, imageView, textView, mapView;

- (IBAction) done: (id) sender{
	[self dismissModalViewControllerAnimated:YES];
}

- (void) updateDetailView{
		
	label.text = node.name;
	textView.text = node.description;
	CLLocationCoordinate2D coords; 
	coords.latitude = node.latitude;
	coords.longitude = node.longitude;
	
	MKCoordinateSpan span; 
	span.latitudeDelta=0.02; 
	span.longitudeDelta=0.02; 
	
	mapView.region = MKCoordinateRegionMake( coords, span ); 
	mapView.zoomEnabled = NO;
	mapView.scrollEnabled = NO;
	
	[mapView addAnnotation:[[MyAnnotation alloc] initWithCoordinate:coords]];

	
	if(node.findable){
		imageView.image = [UIImage imageNamed:@"onbutton.png"];
	}
	else {
		imageView.image = [UIImage imageNamed:@"offbutton.png"];
	}

}


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self updateDetailView];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
