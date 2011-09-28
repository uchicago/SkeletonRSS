//
//  StoryViewController_iPhone.m
//  SkeletonRSS
//
//  Created by T. Andrew Binkowski on 10/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StoryViewController_iPhone.h"
#import "NSString+HTML.h"
#import <Twitter/Twitter.h>

@implementation StoryViewController_iPhone
@synthesize webview;
@synthesize item;
@synthesize dateString,summaryString;

/*******************************************************************************
 * @method          <# Method Name #>
 * @abstract        <# Abstract #>
 * @description     <# Description #>
 ******************************************************************************/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    // Super
    [super viewDidLoad];

    //Load the request in the UIWebView.
    NSURL *url = [NSURL URLWithString:self.item.link];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestObj];                      
    
    // Add button to toolbar
    NSArray* toolbarItems = [NSArray arrayWithObjects:
                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(tweetThis)],nil];
    self.toolbarItems = toolbarItems;

    /* 
	// Date
	if (item.date) {
		NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
		[formatter setDateStyle:NSDateFormatterMediumStyle];
		[formatter setTimeStyle:NSDateFormatterMediumStyle];
		self.dateString = [formatter stringFromDate:item.date];
		[formatter release];
	}
	
	// Summary
	if (item.summary) {
		self.summaryString = [item.summary stringByConvertingHTMLToPlainText];
	} else {
		self.summaryString = @"[No Summary]";
	}
    NSLog(@"Summary:%@",self.item.link);
     */
}

/*******************************************************************************
 * @method          tweetThis
 * @abstract        <# Abstract #>
 * @description     <# Description #>
 ******************************************************************************/
- (void)tweetThis
{
    //Create the tweet sheet
    TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];
    [tweetSheet setInitialText:@"I like this..."];                  //Add a tweet message
    [tweetSheet addImage:[UIImage imageNamed:@"tweetThumb.png"]];   //Add an image
    [tweetSheet addURL:[NSURL URLWithString:self.item.link]];       //Add a link
    
    //Set a blocking handler for the tweet sheet
    tweetSheet.completionHandler = ^(TWTweetComposeViewControllerResult result){
        [self dismissModalViewControllerAnimated:YES];
    };
    
    //Show the tweet sheet!
    [self presentModalViewController:tweetSheet animated:YES];
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"shouldStartLoadWithRequest");
    return YES;
}


#pragma mark - Memory Management
- (void)dealloc {
    [webview release];
    [super dealloc];
}
@end
