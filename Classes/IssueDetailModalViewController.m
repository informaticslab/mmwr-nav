//
//  IssueDetailModalViewController.m
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

#import "IssueDetailModalViewController.h"
#import "Debug.h"
#import "AppManager.h"
#import "LoadingView.h"
#import "TranslatePopover.h"

@implementation IssueDetailModalViewController

@synthesize delegate, webView, navbar, navTitle;
@synthesize popoverController, translateBtnItem, relatedNewsBtnItem;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)viewWillAppear:(BOOL)animated
{
	AppManager *appMgr = [AppManager singletonAppManager];
    CdcArticle *currArticle = appMgr.contentController.currArticle;
    CdcPublication *currPub = appMgr.contentController.currPublication;
	NSString *title;
	
	if (currPub.pubId == CONTINUING_EDUCATION) 
	{
		NSURL *url = [NSURL URLWithString:@"http://www.cdc.gov/mmwr/cme/conted.html"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
		webView.delegate = self;
		[webView loadRequest:req];
		title = @"Continuing Medical Education";
	}
    
    else if (currArticle.validContentTypes & PDF)
    {    
        NSString *thePath = [[NSBundle mainBundle] pathForResource:currArticle.pdfFile ofType:@"pdf"];
        if (thePath) {
			NSData *pdfData = [NSData dataWithContentsOfFile:thePath];
			[webView loadData:pdfData MIMEType:@"application/pdf"
			 textEncodingName:@"utf-8" baseURL:nil];
        }
		title = currArticle.title;
    } else if ((currArticle.validContentTypes & HTML) || (currArticle.validContentTypes & AUDIO)) {
		
		
        NSURL *url = [NSURL URLWithString:currArticle.url];
        NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval: 10.0];
		
		webView.delegate = self;
		[webView loadRequest:req];
		title = currArticle.title;
		
    }
    
    navTitle.title = title;
	
}
- (void)viewDidLoad {

        
}

- (void)webViewDidStartLoad:(UIWebView *)webview {

	LoadingView *loadingView = [LoadingView loadingViewInView:self.webView];
	[loadingView performSelector:@selector(removeView) withObject:nil afterDelay:2.0];
	
	
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
	self.navigationController.navigationItem.leftBarButtonItem = nil;
//	[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='105%'"];
	[self.webView stringByEvaluatingJavaScriptFromString:@"CDC.TextSizer.resize(3)"];
	


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


- (IBAction)btnDoneClicked: (id)sender {
	
	NSLog(@"Modal View Done button hit");
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	if (webView)
		[self.webView loadHTMLString:@"" baseURL:nil];
	[delegate didDismissModalView];
}

- (void)translate:(id)sender {  
	
    DebugLog(@"The translate button has been hit.");  
	
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	else {
		
		TranslatePopover *translatePopover = [[TranslatePopover alloc] initWithNibName:@"TranslatePopover" bundle:nil ];
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:translatePopover];
		self.popoverController = popover;
		popoverController.delegate = self;
		
		[popover release];
		[translatePopover release];
		
		[popoverController presentPopoverFromBarButtonItem:self.translateBtnItem
								  permittedArrowDirections:UIPopoverArrowDirectionAny 
												  animated:YES];
		
	}
	
}  

- (void)getRelatedNews:(id)sender {  
	
    DebugLog(@"The related news button has been hit.");  
	
	if ([self.popoverController isPopoverVisible] == YES ) 
		[popoverController dismissPopoverAnimated:YES];
	else {
		
		TranslatePopover *translatePopover = [[TranslatePopover alloc] initWithNibName:@"TranslatePopover" bundle:nil ];
		UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:translatePopover];
		self.popoverController = popover;
		popoverController.delegate = self;
		
		[popover release];
		[translatePopover release];
		
		[popoverController presentPopoverFromBarButtonItem:self.relatedNewsBtnItem
								  permittedArrowDirections:UIPopoverArrowDirectionAny 
												  animated:YES];
		
	}
	
}  


- (void)dealloc {
    [super dealloc];
}


@end
