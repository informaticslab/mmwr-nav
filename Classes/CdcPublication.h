//
//  CdcPublication.h
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
#import "CdcArticle.h"
#import "CdcIssue.h"

@class CdcIssue;

typedef enum  PublicationType {
	UNDECLARED,
	WEBSITE,
	REPORT,				// reports are a single publication
	MAGAZINE,			// magazines have articles that can be published separately
	PODCAST,
} PublicationType;

typedef enum {
	VITAL_SIGNS,
	WEEKLY_REPORT,
	RECOMMENDATIONS_AND_REPORTS,
	SURVEILLANCE_SUMMARIES,
	NOTIFIABLE_DISEASES,
	PODCASTS,
	SUPPLEMENTS,
	CONTINUING_EDUCATION,
	MAP_NAVIGATOR,
	GRAPH_NAVIGATOR,
} CdcPublicationId;

@interface CdcPublication : NSObject {
	NSString *name;
	PublicationType pubType;
	ContentTypes contentTypes;
	NSMutableArray *issues;	
	int pubId;
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic) PublicationType pubType;
@property ContentTypes contentTypes;
@property int pubId;
@property (nonatomic, retain) NSMutableArray *issues;


-(id)initWithPubIdAndType:(CdcPublicationId)newPubId type:(PublicationType)newPubType;
-(void)addIssue:(CdcIssue *)newIssue;
-(void)addIssues:(id)firstObj,...;
- (NSArray *)getIssues;

@end
