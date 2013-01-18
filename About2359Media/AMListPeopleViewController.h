//
//  AMListPeopleViewController.h
//  About2359Media
//
//  Created by Trieu Khang on 1/17/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AMListPeopleViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *listPeople;

@property (weak, nonatomic) IBOutlet UISearchBar *peopleSearchBar;

@property (strong, nonatomic) NSMutableArray* filteredPeopleArray;

- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
