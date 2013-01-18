//
//  AMViewController.m
//  About2359Media
//
//  Created by Trieu Khang on 1/17/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "AMViewController.h"
#import "AMDownloader.h"

@interface AMViewController ()

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [AMDownloader getDataFromNSURL:@"https://api.mongolab.com/api/1/databases/2359media/collections/user?apiKey=50bc7070e4b07d292a90b92b"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
