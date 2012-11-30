//
//  BaseDetailVC.h
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

#import <UIKit/UIKit.h>
#import "IssueTableView.h"
#import "DetailHomeView.h"
#import "AppManager.h"

@class AppManager;
@class IssueTableView;

@interface BaseDetailVC : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate> {
    UIPopoverController *popoverController;
    UIToolbar *toolbar;
    UINavigationBar *navbar;
	UINavigationController *masterNavigationController;
	UINavigationItem *navTitle;
	UIView *contentView;
	IssueTableView *issueView;
    DetailHomeView *detailHomeView;
    AppManager *appManager;

}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UINavigationBar *navbar; 
@property (nonatomic, retain) IBOutlet UINavigationItem *navTitle;
@property (nonatomic, retain) IBOutlet UIView *contentView;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UINavigationController *masterNavigationController;
@property (nonatomic, retain) IssueTableView *issueView;
@property (nonatomic, retain) DetailHomeView *detailHomeView;
@property (nonatomic, retain) AppManager *appManager;
@property (nonatomic, retain) UIBarButtonItem *searchBtnItem;

- (void)configureView;
- (void)search:(id)sender;
- (void)clearContentView;
- (void)showIssueContentView;
- (void)showHomeContentView;
- (void)setTitle:(NSString *)newTitle;

@end
