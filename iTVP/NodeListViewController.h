//
//  NodeListViewController.h
//  iTVP
//
//  Created by Alexander on 24/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailNodeViewController.h"

@protocol NodeListViewControllerDelegate;

@interface NodeListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
	id <NodeListViewControllerDelegate> delegate;
	UITableView *uiTableView;
	NSMutableArray *serversNodes;
	UIImage *onImage;
	UIImage *offImage;
	DetailNodeViewController *detailNodeViewController;
	
	
}

@property (nonatomic, retain) IBOutlet UITableView *uiTableView;
@property (nonatomic, assign) id <NodeListViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *serversNodes;
@property (nonatomic, retain) UIImage *onImage;
@property (nonatomic, retain) UIImage *offImage;

- (IBAction)done:(id)sender;
- (void) initServersNodeArray;
@end

@protocol NodeListViewControllerDelegate
- (void)nodeListViewControllerDidFinish:(NodeListViewController *)controller;
@end
