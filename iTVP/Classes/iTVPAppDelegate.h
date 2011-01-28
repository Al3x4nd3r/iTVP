//
//  iTVPAppDelegate.h
//  iTVP
//
//  Created by Alexander on 24/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface iTVPAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *mainViewController;
}

@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

