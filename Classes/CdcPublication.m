//
//  CdcPublication.m
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

#import "CdcPublication.h"


@implementation CdcPublication


// these strings should match order of CdcPublicationId in header
NSString *CdcPublicationNames[] = {
	@"Vital Signs",
	@"Weekly Report",
	@"Recommendations & Reports",
	@"Surveillance Summaries",
	@"Notifiable Diseases",
	@"Podcasts",
	@"Supplements",
	@"Continuing Medical Education",
	@"Map Navigator",
	@"Graph Navigator",
};


@synthesize name, contentTypes, pubId, pubType, issues;

- (id)initWithPubIdAndType:(CdcPublicationId)newPubId type:(PublicationType)newPubType
{
	if(self = [super init])
	{
		// get NSSTring name for publication ID
		self.name = CdcPublicationNames[newPubId];
		self.pubId = newPubId;
		self.pubType = newPubType;
	}		
	return self;
}

- (void)addIssue:(CdcIssue *)newIssue
{
	if (self.issues == nil)
		self.issues = [[NSMutableArray alloc] init];
	[self.issues addObject:newIssue];
	
}

- (void)addIssues:(id)firstObj,...
{

	NSMutableArray *temp;
	id eachObject;
	va_list argumentList;
	if (firstObj)                      // The first argument isn't part of the varargs list,
	{                                   // so we'll handle it separately.
		temp = [[NSMutableArray alloc] init];
		[temp addObject: firstObj];
		va_start(argumentList, firstObj);          // Start scanning for arguments after firstObject.
		while ((eachObject = va_arg(argumentList, id))) // As many times as we can get an argument of type "id"
			[temp addObject: eachObject];               // that isn't nil, add it to self's contents.
		va_end(argumentList);
	}
	
	self.issues = (NSMutableArray *)temp;
	[temp release];
	
}

- (NSArray *)getIssues
{
	return (NSArray *)self.issues;
	
}

- (NSString *)description 
{

	NSLog(@"\tPublication Type = 0x%x or %d", self.pubType, self.pubType);
	NSLog(@"\tPublication Content Types = 0x%x or %d", self.contentTypes, self.contentTypes);
	
	
	return	[NSString stringWithFormat:@"CdcPublication at 0x%x has name %@ and %d issues.", self, self.name, [self.issues count]];
}

@end
