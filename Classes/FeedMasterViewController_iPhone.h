//
//  FeedMasterViewController_iPhone.h
//  SkeletonRSS
//
//  Created by T. Andrew Binkowski on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"

@interface FeedMasterViewController_iPhone : UITableViewController <MWFeedParserDelegate>

// Parsing
@property (nonatomic, retain) MWFeedParser *feedParser;
@property (nonatomic, retain) NSMutableArray *parsedItems;

// Displaying
@property (nonatomic, retain) NSArray *itemsToDisplay;
@property (nonatomic, retain) NSDateFormatter *formatter;

@end
