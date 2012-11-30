//
//  SearchPopover.m
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

#import "SearchPopover.h"


@implementation SearchPopover


#pragma mark -
#pragma mark View lifecycle


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	int rows = 0;
    // There are six sections.
    switch (section) {
		case 0:
			rows = 2;
			break;
		case 1:
			rows = 1;
			break;
		default:
			break;
	}
	return rows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"SearchCellIdentifier";
	
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
		
		// switch on sections and then rows
		switch (indexPath.section) 
		{
			case 0:
				// Reading Preferences
				switch (indexPath.row) 
				{
					case 0:
						[cell.textLabel setText:@"Start Date"];
						cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
						break;
					case 1:
						[cell.textLabel setText:@"End Date"];
						cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
						break;
					default:
						break;
				}
				break;
			case 1:
				// Reading Preferences
				switch (indexPath.row) {
					case 0:
						[cell.textLabel setText:@"Weekly Report"];
						cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
						break;
					default:
						break;
				}
				break;
			default:
				break;
				
		}
	}
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
        case 0:
            title = NSLocalizedString(@"Filter By Date", @"");
            break;
        case 1:
            title = NSLocalizedString(@"Filter By Publication", @"");
            break;
        default:
            break;
    }
    return title;
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

