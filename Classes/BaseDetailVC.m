//
//  BaseDetailVC.m
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


#import "BaseDetailVC.h"
#import "Debug.h"
#import "SearchPopover.h"

@implementation BaseDetailVC

@synthesize toolbar, navbar, navTitle;
@synthesize popoverController;
@synthesize masterNavigationController;
@synthesize issueView;
@synthesize contentView;
@synthesize detailHomeView;
@synthesize appManager;
@synthesize searchBtnItem;

- (id)init {
	
	if ( self = [super init]) {
		self.appManager = [AppManager singletonAppManager];
	}
	return self;
	
}


- (void)viewDidLoad {  

	LineLog();
	
    UIBarButtonItem *flexBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace   
																				target:self action:nil];  

    searchBtnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch 
																   target:self action:@selector(search:)];  
    NSArray *items = [NSArray arrayWithObjects:flexBtnItem, searchBtnItem, nil];  
	
    [flexBtnItem release];  
    [toolbar setItems:items];  
	navTitle.title = @"Welcome";
	
    detailHomeView = [[DetailHomeView alloc] initWithNibName:@"DetailHomeView" bundle:nil];
	[self clearContentView];
	[self.contentView addSubview:self.detailHomeView.view]; //add new view
    [self.detailHomeView viewWillAppear:YES];
	[self.issueView viewWillAppear:YES]; //make sure new view is updated

    [super viewDidLoad];  
	
}  

- (void)configureView {
    // Update the user interface for the detail item.

}

-(void)search:(id)sender {  
	
    NSLog(@"The search button has been hit.");  
	
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	else {
		DebugLog(@"The search button has been hit.");
		
		SearchPopover *searchPopover = [[SearchPopover alloc] initWithNibName:@"SearchPopover" bundle:nil ];
        searchPopover.contentSizeForViewInPopover = CGSizeMake(320, 280); 
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:searchPopover];

		self.popoverController = popover;
		popoverController.delegate = self;
		
		[popover release];
		[searchPopover release];
		
		[popoverController presentPopoverFromBarButtonItem:self.searchBtnItem
								  permittedArrowDirections:UIPopoverArrowDirectionAny 
												  animated:YES];
		
	}
}  


-(void) clearContentView {
	//helper to clear content view
	for (UIView *view in [self.contentView subviews]){
        [view removeFromSuperview];
	}
}

- (void)showHomeContentView {
    
	[self clearContentView];
	[self.contentView addSubview:self.detailHomeView.view]; //add new view
    [self.detailHomeView viewWillAppear:YES];
	navTitle.title = @"Welcome";
    
}


- (void)showIssueContentView {

    UIDevice *device = [UIDevice currentDevice];
    
    if ((device.orientation == UIDeviceOrientationPortrait) || (device.orientation == UIDeviceOrientationPortraitUpsideDown)) {
        if (issueView != nil)
            [issueView release];
        issueView = [[IssueTableView alloc] initWithNibName:@"IssueTableView" bundle:nil];
    } else {
        if (issueView != nil)
            [issueView release];
        issueView = [[IssueTableView alloc] initWithNibName:@"IssueTableView_Landscape" bundle:nil];
    }
    
    [issueView.tableView setAutoresizesSubviews:YES];
    [self clearContentView];    
    [self.contentView addSubview:self.issueView.view]; //add new view
    [self.issueView viewWillAppear:YES];

}
 
- (void)setTitle:(NSString *)newTitle
{
	navTitle.title = newTitle;
}
 
#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
	// Add the popover button to the left navigation item.
    [navbar.topItem setLeftBarButtonItem:barButtonItem animated:NO];
	DebugLog(@"added root popover button to navigation bar.");
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
	// Remove the popover button.
    [navbar.topItem setLeftBarButtonItem:nil animated:NO];
	DebugLog(@"removing root popover button from navigation bar.");

}

#pragma mark -
#pragma mark Rotation support
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration 
{
    
}


// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	DebugLog(@" answer is yes");

    return YES;
}
#pragma mark -

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	DebugLog(@"received didRotate.");	


}

- (void)dealloc {
    [super dealloc];
}


@end
