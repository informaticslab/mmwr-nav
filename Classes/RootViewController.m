//
//  RootViewController.m
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

#import "RootViewController.h"
#import "IssuesViewController.h"
#import "IssueTableView.h"
#import "IssueDetailModalViewController.h"
#import "BaseDetailVC.h"
#import "SubstitutableDetailViewController.h"
#import "Debug.h"
#import "FutureFeature.h"
#import "EulaViewController.h"

@implementation RootViewController

@synthesize issuesViewController; 
@synthesize issueTableView;
@synthesize rootPopoverButtonItem;
@synthesize splitViewController;

#pragma mark -
#pragma mark View lifecycle

NSArray * pubs;

- (void)viewDidLoad {
    
	[super viewDidLoad];

	// set default publication as index 0
	[appManager.contentController setCurrentPublicationWithIndex:0];

	self.title = @"MMWR Navigator";
/*	pubs = [[NSArray alloc] initWithObjects:@"Vital Signs", 
											@"Weekly Report",  
											@"Recommendations & Reports", 
											@"Surveillance Summaries", 
                                            @"Notifiable Diseases", 
											@"Podcasts", 
											@"Supplements", 
                                            @"Continuing Medical Education", 
											nil];
*/
	pubs = [self.appManager.contentController getPublications];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
	
}

- (void)viewWillAppear:(BOOL)animated {
	
    [self presentEulaModalView];
	[self.baseDetailVC showHomeContentView];

	
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

#pragma mark -
#pragma mark Modal view delegate


- (void)didDismissModalView {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)presentEulaModalView
{
    
    if (appManager.agreedWithEula == TRUE)
        return;
    
    // store the data
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *currVersion = [NSString stringWithFormat:@"%@.%@", 
                             [appInfo objectForKey:@"CFBundleShortVersionString"], 
                             [appInfo objectForKey:@"CFBundleVersion"]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersionEulaAgreed = (NSString *)[defaults objectForKey:@"agreedToEulaForVersion"];
    
    
    // was the version number the last time EULA was seen and agreed to the 
    // same as the current version, if not show EULA and store the version number
    if (![currVersion isEqualToString:lastVersionEulaAgreed]) {
        [defaults setObject:currVersion forKey:@"agreedToEulaForVersion"];
        [defaults synchronize];
        NSLog(@"Data saved");
        NSLog(@"%@", currVersion);
        
        // Create the modal view controller
        EulaViewController *eulaVC = [[EulaViewController alloc] initWithNibName:@"EulaViewController" bundle:nil];
        
        // we are the delegate that is responsible for dismissing the help view
        eulaVC.delegate = self;
        eulaVC.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentModalViewController:eulaVC animated:YES];
        
    }
    
}




#pragma mark -
#pragma mark Rotation support

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//	DebugLog(@" answer is yes");
//    return YES;
//}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}


- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
    
	if ([appManager.splitviewPopover isPopoverVisible] == YES)
		[appManager.splitviewPopover dismissPopoverAnimated:YES];
	
    // Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
    barButtonItem.title = @"MMWR Navigator";
	appManager.splitviewPopover = pc;
	//self.popoverController = pc;
    self.rootPopoverButtonItem = barButtonItem;
    UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
    [detailViewController showRootPopoverButtonItem:rootPopoverButtonItem];

}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
    // Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
    UIViewController <SubstitutableDetailViewController> *detailViewController = [splitViewController.viewControllers objectAtIndex:1];
    [detailViewController invalidateRootPopoverButtonItem:rootPopoverButtonItem];
    self.rootPopoverButtonItem = nil;
	appManager.splitviewPopover = nil;
}

- (void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController *)aViewController{
	if ([appManager.splitviewPopover isPopoverVisible] == YES)
		[appManager.splitviewPopover dismissPopoverAnimated:YES];
//	if (self.popoverController != nil) {
	//	[self.popoverController dismissPopoverAnimated:YES];
//}
}



#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [pubs count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PublicationsCell";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell.
	[self setDefaultAppCellStyle:cell];
    cell.textLabel.text = [pubs objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     When a row is selected, set the detail view controller's detail item to the item associated with the selected row.
     */
	// navigation logic:
	// create and push another view controller
	// create the data controller if not already done

	[appManager.contentController setCurrentPublicationWithIndex:indexPath.row];
	
	if (appManager.contentController.currPublication.pubId == CONTINUING_EDUCATION) 
	{
		
		IssueDetailModalViewController *viewController = [[IssueDetailModalViewController alloc] initWithNibName:@"IssueDetailModalView" bundle:nil];
		
		viewController.delegate = appManager.modalDelegate;
		viewController.modalPresentationStyle = UIModalPresentationPageSheet;
		[appManager.modalDelegate presentModalViewController:viewController animated:YES];
		
		// Clean up resources
		[viewController release];	
		
	} 
	else if ((appManager.contentController.currPublication.pubId == MAP_NAVIGATOR)||(appManager.contentController.currPublication.pubId == GRAPH_NAVIGATOR)) 
	{
		FutureFeature *futureVC = [[FutureFeature alloc] initWithNibName:@"FutureFeature" bundle:nil];
		
		futureVC.delegate = appManager.modalDelegate;
		futureVC.modalPresentationStyle = UIModalPresentationFormSheet;
		[appManager.modalDelegate presentModalViewController:futureVC animated:YES];
		
		// Clean up resources
		[futureVC release];	
		
	} 
	else {
		
		if (issuesViewController != nil) {
			[issuesViewController release];
			issuesViewController = nil;
		}
		
		if (issuesViewController == nil) {
			issuesViewController = [[IssuesViewController alloc] initWithStyle:UITableViewStylePlain];

		}
		
		issuesViewController.baseDetailVC = self.baseDetailVC;
		//	issueTableView = [[IssueTableView alloc] initWithNibName:@"IssueTableView" bundle:nil];
		
		[self.navigationController pushViewController:issuesViewController
											 animated:YES];
		
	}

	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

