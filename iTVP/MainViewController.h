//
//  MainViewController.h
//  iTVP
//
//  Created by Alexander on 24/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NodeListViewController.h"


@interface MainViewController : UIViewController <UITextFieldDelegate, NodeListViewControllerDelegate> {
	UITextField *ipTextField;
}

@property (nonatomic, retain) IBOutlet UITextField *ipTextField;

- (IBAction)showNodeList:(id)sender;
- (NSMutableArray *) retrieveURLInfo: (NSString *) localization;
- (void) showInfoDialog: (NSString *) title andMessage:(NSString *) message;

@end
