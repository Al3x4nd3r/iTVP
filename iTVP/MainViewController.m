//
//  MainViewController.m
//  iTVP
//
//  Created by Alexander on 24/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "ITVPXMLReader.h"
#import <stdio.h>

@implementation MainViewController

@synthesize ipTextField;

- (void)nodeListViewControllerDidFinish:(NodeListViewController *)controller{
	[self dismissModalViewControllerAnimated:YES];
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
	[self shouldAutorotateToInterfaceOrientation:YES];
	[ipTextField setDelegate:self];
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == ipTextField) {
        [ipTextField resignFirstResponder];
    }
    return YES;
}

- (void) showInfoDialog: (NSString *) title andMessage:(NSString *) message{
	NSLog(@"Botão de alterar informações foi acionado.");
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
													message:message
												   delegate:nil 
										  cancelButtonTitle:@"OK" 
										  otherButtonTitles: nil];
	[alert show];
	[alert release];
}


- (NSMutableArray *) retrieveURLInfo:(NSString *)localization{
	
	NSLog(@"Acessando URL %@", localization);
	
	/*NSURL *url = [NSURL URLWithString:localization];
	
	NSString *result = [[NSString alloc] initWithContentsOfURL:url
														encoding:NSUTF8StringEncoding error:nil];*/


	
	ITVPXMLReader* reader = [ITVPXMLReader alloc];
	NSMutableArray* nodes = [reader parse:localization];
	//[nodes addObject:nil];
	
	

	if( reader.error ){
		NSLog(@"Teve Erro.");
		return nil;
	}

	NSLog(@"Quantidade %d", [nodes count]);
	for(int i = 0 ; i < [nodes count]; i++){
		ITVPNode *node = (ITVPNode *) [nodes objectAtIndex:i];
		NSLog(@"NODE -->>> %@", node.name);
	}
	//NSLog(@"Resultado\n %@", result);
	
	
	return nodes;
}

- (IBAction)showNodeList:(id)sender{
	NSString *ip = [[ipTextField text] copy];
	bool isValid = YES;
	
	if([ip length] >= 7){
		isValid = YES;
	}
	
	NSLog(@"IP Recebido %@", ip);
	NSMutableArray * nodes = nil;
	if(!isValid){
		[self showInfoDialog:@"IP Inválido" andMessage:@"O IP digitado não é válido" ];
		return;
	}
	else {
		nodes = [self retrieveURLInfo:ip];
		if(nodes == nil){
			[self showInfoDialog:@"Erro" andMessage:@"Não consegui obter nenhum conteúdo nesse endereço." ];
			return;
		}
	}
	
	self.title = @"Inicio";
	
	NodeListViewController *controller = [[NodeListViewController alloc] 
												   initWithNibName:@"NodeListViewController" bundle: [NSBundle mainBundle]];

	controller.delegate = self;
	controller.serversNodes = nodes;

	[[controller navigationController] pushViewController:controller animated:YES];
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	
	[self presentModalViewController:controller animated:YES];
	[ipTextField resignFirstResponder];

	[ip release];
}

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
	[ipTextField release];
    [super dealloc];
}


@end
