//
//  AppManager.h
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

#import <Foundation/Foundation.h>

#define DEBUG 
#import "Debug.h"
#import "BaseDetailVC.h"
#import "BaseMasterVC.h"
#import "ContentController.h"
#import "ModalViewDelegate.h"

@class BaseDetailVC;
@class BaseMasterVC;
@class ContentController;
@class RootViewController;

@interface AppManager : NSObject {
    NSString *appName;
    id<ModalViewDelegate> modalDelegate;
	BaseDetailVC *baseDetailVC;
	BaseMasterVC *baseMasterVC;
	UIPopoverController *splitviewPopover;   
	ContentController *contentController;
    BOOL agreedWithEula;


}

@property (nonatomic, retain) NSString *appName;
@property (nonatomic, retain) UIPopoverController *splitviewPopover;
@property (nonatomic, retain) ContentController *contentController;
@property (nonatomic, retain) id<ModalViewDelegate> modalDelegate;
@property BOOL agreedWithEula;


+ (id)singletonAppManager;

@end
