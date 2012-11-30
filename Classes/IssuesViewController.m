//
//  IssuesViewController.m
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

#import "IssuesViewController.h"
#import "IssueDetailModalViewController.h"
#import "ModalViewDelegate.h"
#import "ContentController.h"
#import "CdcIssue.h"

@implementation IssuesViewController


#pragma mark -
#pragma mark Initialization


#pragma mark -
#pragma mark View lifecycle
NSArray * issues;
- (id) init {

	[super init];
	return self;

}
- (void)viewDidLoad {
	
	LineLog();
    [super viewDidLoad];
	
    // title with word "Issues" is too long
    self.title = [NSString stringWithFormat:@"%@", self.appManager.contentController.currPublication.name];
//    self.title = [NSString stringWithFormat:@"%@ Issues", self.appManager.contentController.currPublication.name];
//    self.title = @"Issues";
    
	
	issues = [self.appManager.contentController getCurrentIssues];

    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
	
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
	DebugLog(@" answer is yes");
    return YES;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	DebugLog(@"received didRotate.");	
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	DebugLog("Issues count = %d", [issues count]);
    return [issues count];

}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"IssuesCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	[self setDefaultAppCellStyle:cell];
	[cell sizeToFit];
	cell.textLabel.text = [issues objectAtIndex:indexPath.row];
    return cell;
	
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	// tell baseDetailViewController
	// to display issue table of contents
	[self.appManager.contentController setCurrentIssueWithIndex:indexPath.row];
	[self.baseDetailVC showIssueContentView];
	[self.baseDetailVC setTitle:[issues objectAtIndex:indexPath.row]];
	
	if ([appManager.splitviewPopover isPopoverVisible]) 
		[appManager.splitviewPopover dismissPopoverAnimated:YES];
	
}

#pragma mark -
#pragma mark Modal view delegate

- (void)didDismissModalView {
	LineLog();
    
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

