//
//  NodeListViewController.m
//  iTVP
//
//  Created by Alexander on 24/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NodeListViewController.h"
#import "ITVPNode.h"
#import <MapKit/MapKit.h>



@implementation NodeListViewController

@synthesize delegate, uiTableView, serversNodes, onImage, offImage;

- (IBAction)done:(id)sender {
	[self.delegate nodeListViewControllerDidFinish:self];	
}

- (void) initServersNodeArray{
	ITVPNode *nodeJP = [[ITVPNode alloc] initWithId:0 
										  withState:YES withName:@"João Pessoa" 
									 withDescription:@"A cidade mais verde do Brasil, um dos principais nós." 
									   withLatitude: -7.117245 withLongitude: -34.876442]; 
	ITVPNode *nodeRE = [[ITVPNode alloc] initWithId:0 
										  withState:YES withName:@"Recife" 
									withDescription:@"A cidade mais verde do Brasil, um dos principais nós." 
									   withLatitude: -8.054301 withLongitude: -34.880733]; 
	ITVPNode *nodeRJ = [[ITVPNode alloc] initWithId:0 
										  withState:NO withName:@"Rio de Janeiro" 
									withDescription:@"A cidade mais verde do Brasil, um dos principais nós." 
									   withLatitude: -22.892623 withLongitude: -43.209229];  
	ITVPNode *nodeBR = [[ITVPNode alloc] initWithId:0 
										  withState:true withName:@"Brasilia" 
									withDescription:@"A cidade mais verde do Brasil, um dos principais nós." 
									   withLatitude: -15.779039 withLongitude: -47.92511];
	
	self.serversNodes = [[NSMutableArray alloc] initWithObjects:nodeJP, nodeRE, nodeRJ, nodeBR, nil];
	
	
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
    [super viewDidLoad];
	//[self initServersNodeArray];
	self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
	[uiTableView setDelegate:self];
	[uiTableView setDataSource:self];
	
	onImage = [UIImage imageNamed:@"onbutton.png"];
	offImage = [UIImage imageNamed:@"offbutton.png"];
	
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
	[detailNodeViewController release];
	[onImage release];
	[offImage release];
	[serversNodes release];
	[uiTableView release];
    [super dealloc];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.serversNodes count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	ITVPNode * actualNode = (ITVPNode *) [[self serversNodes] objectAtIndex:[indexPath row]];
    //cell.textLabel.textAlignment = UITextAlignmentCenter;
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    // Configure the cell...
	cell.textLabel.text = actualNode.name;
	
	if(actualNode.findable){
		cell.imageView.image = onImage;
	}
	else{
		cell.imageView.image = offImage;
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
	NSLog(@"Accessory Button clicked....");
	ITVPNode * actualNode = (ITVPNode *) [[self serversNodes] objectAtIndex:[indexPath row]];
	
	DetailNodeViewController * detailController = [[DetailNodeViewController alloc] 
												   initWithNibName:@"DetailNodeViewController" bundle:[NSBundle mainBundle]];

	detailController.node = actualNode;
	//[detailController updateView:actualNode];
	detailController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
	//[[self navigationController] presentModalViewController:detailController animated:YES];
	
														   
	[self presentModalViewController:detailController animated:YES];

	NSLog(@"Finish acessory");
}

@end
