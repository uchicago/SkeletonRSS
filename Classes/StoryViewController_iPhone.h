//
//  StoryViewController_iPhone.h
//  SkeletonRSS
//
//  Created by T. Andrew Binkowski on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedItem.h"

@interface StoryViewController_iPhone : UIViewController <UIWebViewDelegate>
@property (nonatomic, retain) MWFeedItem *item;
@property (nonatomic, retain) NSString *dateString;
@property (nonatomic, retain) NSString *summaryString;
@property (retain, nonatomic) IBOutlet UIWebView *webview;
@end
