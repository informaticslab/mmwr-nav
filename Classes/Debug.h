//
//  Debug.h
//  mmwrMockup
//
//  Created by Greg Ledbetter on 7/16/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifdef DEBUG
	#define DebugLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
	#define LineLog() DebugLog(@"");
#else
	#define DebugLog(...)
	#define LineLog(...)
#endif

// Info Log always displays output regardless of the DEBUG setting
#define InfoLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

