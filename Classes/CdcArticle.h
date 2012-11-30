//
//  CdcArticle.h
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

typedef enum ContentTypes {
	CONTENT_TYPE_UNDECLARED,
	PDF,
	HTML,
	TEXT,
	AUDIO
} ContentTypes;


@interface CdcArticle : NSObject {
	NSString *title;
	NSString *teaser;
	NSString *textContent;
	NSString *url;
	NSString *pdfFile;
	ContentTypes validContentTypes;
	
}

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *teaser;
@property (nonatomic, retain) NSString *textContent;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *pdfFile;
@property (nonatomic) ContentTypes validContentTypes;

-(id)initWithTitle:(NSString *)newTitle;
-(void)addTextContent:(NSString *)newTextContent;

@end
