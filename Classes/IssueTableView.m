//
//  IssueTableView.m
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

#import "IssueTableView.h"
#import "IssueDetailModalViewController.h"
#import "ModalViewDelegate.h"
#import "Debug.h"
#import "AppManager.h"

@implementation IssueTableView

@synthesize appManager;
#pragma mark -
#pragma mark View lifecycle

NSArray *articles, *firstLineInArticle;


- (void)viewDidLoad {
	
	LineLog();
	
    [super viewDidLoad];
    self.appManager = [AppManager singletonAppManager];

//	AppManager *appManager = [AppManager singletonAppManager];

	
	articles = [appManager.contentController getCurrentArticleTitles];
	firstLineInArticle = [appManager.contentController getCurrentArticleTeasers];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear {


	articles = [appManager.contentController getCurrentArticleTitles];
	firstLineInArticle = [appManager.contentController getCurrentArticleTitles];
	[self.tableView reloadData];
	
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration 
{
    //m_orientation = toInterfaceOrientation; 
//    [self.tableView reloadData]; 
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
	DebugLog(@" answer is yes");
	return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	DebugLog(@"received didRotate.");
	[self.tableView setNeedsLayout]; 
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath  
{  
    return 120.0; //returns floating point which will be used for a cell row height at specified row index  
}  
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [articles count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"IssueTableViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    // Configure the cell...
	cell.textLabel.text = [articles objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont boldSystemFontOfSize:18];
	cell.detailTextLabel.text = [firstLineInArticle objectAtIndex:indexPath.row];
	cell.detailTextLabel.numberOfLines = 5;
	cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:14];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // set current article
    [appManager.contentController setCurrentArticleWithIndex:indexPath.row];
	IssueDetailModalViewController *viewController = [[IssueDetailModalViewController alloc] initWithNibName:@"IssueDetailModalView" bundle:nil];

	viewController.delegate = appManager.modalDelegate;
	if (appManager.contentController.currArticle.validContentTypes == AUDIO)
		viewController.modalPresentationStyle = UIModalPresentationFormSheet;
	else
		viewController.modalPresentationStyle = UIModalPresentationPageSheet;
	[appManager.modalDelegate presentModalViewController:viewController animated:YES];
	
	// Clean up resources
	[viewController release];	
	
}


- (void)didDismissModalView {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

