//
//  CdcIssue.m
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

#import "CdcIssue.h"


@implementation CdcIssue

@synthesize issueId;
@synthesize articles;

-(id)initWithIssueId:(NSString *)newIssueId
{
	if (self = [super init]) {
		self.issueId = newIssueId;
		self.articles = [[NSMutableArray alloc] init];
	}
	
	return self;
}

-(id)init
{
	return [self initWithIssueId:nil];
	
}

- (int)addArticle:(CdcArticle *)newArticle
{
	[self.articles addObject:newArticle];
	return [self.articles count]; 
	
}

- (NSArray *)getArticles
{
	return (NSArray *)self.articles;
	
}


- (NSString *)description {
	
	return	[NSString stringWithFormat:@"CdcIssue at 0x%x has issueId %@ and %d articles.", self, self.issueId, [self.articles count]];
}


@end
