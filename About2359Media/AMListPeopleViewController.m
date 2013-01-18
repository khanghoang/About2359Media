//
//  AMListPeopleViewController.m
//  About2359Media
//
//  Created by Trieu Khang on 1/17/13.
//  Copyright (c) 2013 Hoang Trieu Khang. All rights reserved.
//

#import "AMListPeopleViewController.h"
#import "AMDownloader.h"
#import "JSONKit.h"
#import "AMPerson.h"

@interface AMListPeopleViewController () <UISearchBarDelegate, UISearchDisplayDelegate>


@end

@implementation AMListPeopleViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //get data
    NSURL *url = [NSURL URLWithString:@"https://api.mongolab.com/api/1/databases/2359media/collections/user?apiKey=50bc7070e4b07d292a90b92b"];
    
//    //if doesnt have it will be error
//    __weak NSMutableArray *weakSelf = self.listPeople;
    
    //where we call block
    [AMDownloader getDataFromURL:url success:^(id JSON) {
        //do when success
        
        //check if received data is NSData
        if([JSON isKindOfClass:[NSArray class]])
        {
            self.listPeople = JSON;
            
            [self.listPeople enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL *stop)
             {
                 [self.listPeople replaceObjectAtIndex:idx withObject:[AMPerson initPersonFromDictionary:item]];
                 
                 if(idx == self.listPeople.count)
                 {
                     *stop = YES;
                 }
             }];
            
            [self.tableView reloadData];
        
        }
        
    } failure:^(NSError *error) {
        //do when failure
        NSLog(@"Error");
    }];
    
    //
    

    

    NSLog(@"%@", [self.listPeople componentsJoinedByString:@", "]);
    
    // Initialize the filteredCandyArray with a capacity equal to the candyArray's capacity
    self.filteredPeopleArray = [NSMutableArray arrayWithCapacity:[self.listPeople count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return self.listPeople.count;
    if (self.tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredPeopleArray count];
    } else {
        return [self.listPeople count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"My custom cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if(!cell)
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if (self.tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [[self.filteredPeopleArray objectAtIndex:indexPath.row] valueForKey:@"name"];
//        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.listPeople objectAtIndex:indexPath.row ] valueForKey:@"name"] ];
    } else {
        
        AMPerson* person = [self.listPeople objectAtIndex:indexPath.row];        
        cell.textLabel.text = person.name;
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.listPeople objectAtIndex:indexPath.row ] valueForKey:@"name"] ];
    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[self.listPeople objectAtIndex:indexPath.row ] valueForKey:@"role"] ];
//    
//    //self.tableView.rowHeight = [self tableView:self.tableView heightForRowAtIndexPath:indexPath];
//    
//    [cell.detailTextLabel setFrame:CGRectMake(10, 24, 268, [self tableView:self.tableView heightForRowAtIndexPath:indexPath] + 20)];
//    
//    cell.detailTextLabel.numberOfLines = 0;
//    
//    CGRect frame = cell.detailTextLabel.frame;
//    frame.size.height = [self tableView:self.tableView heightForRowAtIndexPath:indexPath] + 20;
//    cell.detailTextLabel.frame = frame;
//    [cell.detailTextLabel sizeToFit];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)aTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    NSString *cellText = [NSString stringWithFormat:@"%@", [[self.listPeople objectAtIndex:indexPath.row ] valueForKey:@"role"]];
//                          
//    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:17.0];
//    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
//    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//    
//    return labelSize.height + 20;
//    
////    return 100;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"Show person details"])
    {
//        segue.destinationViewController 
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    // Tells the table data source to reload when text changes
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    // Tells the table data source to reload when scope bar selection changes
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}

#pragma mark Content Filtering
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    // Update the filtered array based on the search text and scope.
    // Remove all objects from the filtered search array
    [self.filteredPeopleArray removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c] %@",searchText];
    self.filteredPeopleArray = [NSMutableArray arrayWithArray:[self.listPeople filteredArrayUsingPredicate:predicate]];
}

@end
