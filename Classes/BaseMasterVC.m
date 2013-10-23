//
//  BaseMasterVC.m
//  mmwrMockup
//
//
//  Copyright 2011  U.S. Centers for Disease Control and Prevention
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software 
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "BaseMasterVC.h"
#import "AppManager.h"
#import "HelpModalView.h"
#import "SettingsModalView.h"
#import "SettingsPopoverView.h"
#import "TranslatePopover.h"


@implementation BaseMasterVC


@synthesize baseDetailVC;
@synthesize appManager;
@synthesize popoverController;
@synthesize settingsBtnItem;
@synthesize refreshBtnItem;


- (id)init {
	
	if ( self = [super init]) {
		self.appManager = [AppManager singletonAppManager];
	}
	return self;
	
}

- (void)viewDidLoad {  
	
	
    self.settingsBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"Settings"   
																	   style:UIBarButtonItemStyleBordered 
                                                                      target:self 
                                                                      action:@selector(settings:)];  
	
	
	self.refreshBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh 
																				   target:self
																				   action:@selector(refresh:)];	
	
	UIBarButtonItem *flexBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace   
																				target:self 
                                                                                action:nil];  
    UIBarButtonItem *helpBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"Help"   
                                                                   style:UIBarButtonItemStyleBordered 
                                                                  target:self 
                                                                  action:@selector(help:)];  
    
    NSArray *items = [NSArray arrayWithObjects: refreshBtnItem,  flexBtnItem, settingsBtnItem,helpBtnItem, nil];  
	//baseDetailVC = [self.splitViewController.viewControllers objectAtIndex:1];
	
	// blue
	self.tableView.backgroundColor = [UIColor colorWithRed:59/255.0 green:89/255.0 blue:152.0/255.0 alpha:1.0];

	// gun metal grey
	//self.tableView.backgroundColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51.0/255.0 alpha:1.0];

	// brown
	//self.tableView.backgroundColor = [UIColor colorWithRed:136/255.0 green:100/255.0 blue:79/255.0 alpha:1.0];
	self.tableView.separatorColor = [UIColor blackColor];

    //[settingsBtnItem release];  
    [flexBtnItem release];  
    [helpBtnItem release];  
	[refreshBtnItem release];
	self.appManager = [AppManager singletonAppManager];
	
    [self setToolbarItems:items];  
    [super viewDidLoad];  
}  

- (void)setDefaultAppCellStyle:(UITableViewCell *)cell {

    // Configure the cell.
	cell.textLabel.textColor = [UIColor whiteColor]; // one of the standard colors
    //cell.backgroundColor = [UIColor blueColor];
	cell.backgroundColor = [UIColor colorWithRed:59/255.0 green:89/255.0 blue:152.0/255.0 alpha:1.0];
	cell.textLabel.font = [UIFont boldSystemFontOfSize:18];

}

#pragma mark -
#pragma mark Rotation support

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//	DebugLog(@" answer is yes");
//    return YES;
//	
//}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	DebugLog(@"received didRotate.");	
}


- (void)didDismissModalView {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
	[popoverController release];
    
}

- (void)refresh:(id)sender
{
	
    DebugLog(@"The refresh button has been hit.");  
	
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	else {
		
		
		// use translate popover as it displays "New feature" text
		TranslatePopover *translatePopover = [[TranslatePopover alloc] initWithNibName:@"TranslatePopover" bundle:nil ];
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:translatePopover];
		self.popoverController = popover;
		popoverController.delegate = self;
		
		[popover release];
		[translatePopover release];
		
		[popoverController presentPopoverFromBarButtonItem:self.refreshBtnItem
								  permittedArrowDirections:UIPopoverArrowDirectionAny 
												  animated:YES];
		
	}
	
	
}

- (void)help:(id)sender {  
	
    DebugLog(@"The help button has been hit.");  
	
	// show the Help view modally
	HelpModalView *helpVC = [[HelpModalView alloc] initWithNibName:@"HelpModalView" bundle:nil];
	
	// we are the delegate that is responsible for dismissing the help view
	helpVC.delegate = self;
	helpVC.navTitle.title = @"Help time";
	helpVC.modalPresentationStyle = UIModalPresentationPageSheet;
	[self presentModalViewController:helpVC animated:YES];
	
	// Clean up resources
	[helpVC release];	
	
}  

- (void)settings:(id)sender{  
	
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	else {
	DebugLog(@"The settings button has been hit.");
	
	SettingsPopoverView *settingsPopover = [[SettingsPopoverView alloc] initWithNibName:@"SettingsPopoverView" bundle:nil ];
    settingsPopover.contentSizeForViewInPopover = CGSizeMake(360,600);

	UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:settingsPopover];
	self.popoverController = popover;
	popoverController.delegate = self;
	
	[popover release];
	[settingsPopover release];
	
	[popoverController presentPopoverFromBarButtonItem:self.settingsBtnItem
							  permittedArrowDirections:UIPopoverArrowDirectionAny 
											  animated:YES];

	}

}  


@end
