//
//  BaseMasterVC.h
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
#import "BaseDetailVC.h"
#import "AppManager.h"
#import "ModalViewDelegate.h"

@class AppManager;
@class BaseDetailVC;

@interface BaseMasterVC : UITableViewController <UISplitViewControllerDelegate, ModalViewDelegate,  UIPopoverControllerDelegate> {

	BaseDetailVC *baseDetailVC;
	AppManager *appManager;
	UIPopoverController *popoverController;
}

@property (nonatomic, retain) BaseDetailVC *baseDetailVC;
@property (nonatomic, retain) AppManager *appManager;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *settingsBtnItem;
@property (nonatomic, retain) UIBarButtonItem *refreshBtnItem;

- (void)refresh:(id)sender;  
- (void)settings:(id)sender;  
- (void)help:(id)sender;  
- (void)setDefaultAppCellStyle:(UITableViewCell *)cell;

@end
