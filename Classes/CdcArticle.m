//
//  CdcArticle.m
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

#import "CdcArticle.h"


@implementation CdcArticle

@synthesize title, teaser, textContent, url, pdfFile, validContentTypes;

-(id)initWithTitle:(NSString *)newTitle
{
	if ((self = [super init])) {
		self.title = newTitle;
	}
	
	return self;
	
}

-(id)init
{
	return [self initWithTitle:nil];
	
}

-(void)addTextContent:(NSString *)newTextContent
{
	self.textContent = newTextContent;
}

- (NSString *)description {
	return	[NSString stringWithFormat:@"CdcArticle at 0x%x has title %@.", self, self.title];

}
@end
