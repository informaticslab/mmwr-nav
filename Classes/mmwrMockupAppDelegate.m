//
//  mmwrMockupAppDelegate.m
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

#import "mmwrMockupAppDelegate.h"


#import "RootViewController.h"
#import "BaseDetailVC.h"
#import "AppManager.h"
#import "CdcPublication.h"
#import "CdcIssue.h"

@implementation mmwrMockupAppDelegate

@synthesize window, splitViewController, rootViewController, baseDetailVC;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	// create singleton instance of application manager
	AppManager *appMgr = [AppManager singletonAppManager];
//	appMgr.rootViewController = self.rootViewController;
    appMgr.modalDelegate = self.rootViewController;
	DebugLog(@"Launching the CDC %@ for iPad.", appMgr.appName);
	
	//[self test];
    // Add the split view controller's view to the window and display.
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
	
	rootViewController.baseDetailVC = baseDetailVC;

    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
   
	// Save data if appropriate
	
	
}



#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}

#pragma mark -
#pragma mark Test code

- (void)test {
	
	CdcPublication *pub = [[CdcPublication alloc] init];
	pub.pubType = MAGAZINE;
	pub.contentTypes = HTML|TEXT;
	
	NSLog(@"Publication type = 0x%x or %d", pub.pubType, pub.pubType);
	NSLog(@"Content types = 0x%x or %d", pub.contentTypes, pub.contentTypes);

	CdcPublication *newPub = [[CdcPublication alloc] initWithPubIdAndType:WEEKLY_REPORT type:MAGAZINE];
	CdcIssue *newIssue = [[CdcIssue alloc] initWithIssueId:@"June 25, 2010, Vol. 59, No. 24"];
	CdcArticle *newArticle = [[CdcArticle alloc] initWithTitle:@"West Nile Virus Activity --- United States, 2009"];
	NSLog(@"%@",newArticle);
	[newIssue addArticle:newArticle];
	NSLog(@"%@",newIssue);

	[newPub addIssue:newIssue];
	
	//AppManager *appMgr = [AppManager singletonAppManager];
	//pubs = [self.appManager.contentController getPublications];
	
	//newIssue = [[CdcIssue alloc] initWithIssueId:@"June 18, 2010, Vol. 59, No. 23"];
	NSLog(@"%@",newPub);

	
}

@end

