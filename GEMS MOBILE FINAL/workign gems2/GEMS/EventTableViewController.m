//
//  EventTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventTableViewController.h"
#import "EventTableViewCell.h"
#import "SettingTableViewController.h"
#import "EventDetailViewController.h"
#import "EventDetailTabBarController.h"
#import "EventList.h"
#import "SBJson.h"


@interface EventTableViewController ()

@end

@implementation EventTableViewController

@synthesize sectionDateFormatter, cellDateFormatter, sections, sortedDays, eventSearchResult, event, eventID, eventIDArray,fromDate, toDate, eventStartDateArray;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    //eventStartDateArray = [[NSMutableArray alloc] init];
    [self searchEventList:fromDate:toDate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    eventIDArray = [[NSMutableArray alloc] init];
    fromDate = @"2012-10-03";
    toDate = @"2012-11-03";


    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.eventStartDateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int countTemp = 0;
    // Return the number of rows in the section.
    for(int j = 0; j < self.event.count; j++){
        
        EventList *elist = [[EventList alloc] init];
        elist = [event objectAtIndex:j];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [eventStartDateArray objectAtIndex:section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = elist.eventStartDate;
        if([tempstr isEqualToString:tempstr2]){
            //if(plist.programStartDate== [programStartDateArray objectAtIndex:section]){
            countTemp = countTemp + 1;
        }
        
    }
    
    return countTemp;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //EventList *elist = [[EventList alloc] init];
    //elist = [event objectAtIndex:section];
    //return elist.eventStartDate;
    return [self.eventStartDateArray objectAtIndex:section];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    static NSString *CellIdentifier = @"eventTableCell";
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[EventTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    
    
    int countTemp2 = 0;
    
    for(int k = 0; k < self.event.count; k++){
        
        EventList *elist = [[EventList alloc] init];
        elist = [event objectAtIndex:k];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [eventStartDateArray objectAtIndex:indexPath.section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = elist.eventStartDate;
        
        
        if([tempstr isEqualToString:tempstr2]){
            if (countTemp2 == indexPath.row) {
                
                cell.eventNameLabel.text = elist.eventValue;
                return  cell;
            }
            countTemp2++;
            
            
        }
    }
    //[eventStartDateArray addObject:elist.eventStartDate];

    // Configure the cell...
    return cell;
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
    //EventDetailViewController *eventDetailVC = [[EventDetailViewController alloc] init];
    //EventDetailTabBarController *eventDetailVC = [[EventDetailTabBarController alloc] init];
    //eventDetailVC.eventID = [eventIDArray objectAtIndex:indexPath.row];
    //[self.navigationController pushViewController:eventDetailVC animated:YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Go Setting"])
    {
        // Get reference to the destination view controller
        SettingTableViewController *targetVC = [segue destinationViewController];
        // Pass any objects to the view controller here, like...
        targetVC.par = self;
    }
    else if ([[segue identifier] isEqualToString:@"Go Event Tab Detail"])
    {
        // Get reference to the destination view controller
        EventDetailTabBarController *targetVC = [segue destinationViewController];
        NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
        
        int countTemp2 = 0;
               
        for(int k = 0; k < self.event.count; k++){
            
            EventList *elist2 = [[EventList alloc] init];
            elist2 = [event objectAtIndex:k];
            
            //if(elist2.eventStartDate == [eventStartDateArray objectAtIndex:rowSelected.section]){
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [eventStartDateArray objectAtIndex:rowSelected.section];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = elist2.eventStartDate;
            
            
            if([tempstr isEqualToString:tempstr2]){
                
                if (countTemp2 == rowSelected.row) {
                    
                    targetVC.eventID = elist2.eventKey;
                    
                    return;
                }
                countTemp2++;
                
                
            }
        }

        
        
        //targetVC.eventID = [eventIDArray objectAtIndex:rowSelected.row];
        // Pass any objects to the view controller here, like...
    }
}


-(void) searchEventList:(NSString *)fd:(NSString *)td{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/EvmsService.svc/REST/GetAllEvents?fd=%@&td=%@", fd, td]];
    
    NSURLRequest *req =  [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (!connection){
        NSLog(@"Error while starting connection!");
        [data release];
        
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData {
    [data appendData:someData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [connection release];
    [data release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)conn {
    [conn release];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    NSDictionary *item;
    
    NSArray* jsonItems = [jsonString JSONValue];
    event = [[NSMutableArray alloc] init];
    eventStartDateArray = [[NSMutableArray alloc] init];
    
    for(item in jsonItems){
        EventList* elist = [[EventList alloc]  initWithJSONDictionnary:item];
        [event addObject:elist];
        [eventStartDateArray addObject:elist.eventStartDate];
    }
    
      //  eventStartDateArray = [[NSMutableArray alloc] init];
    
    [self.tableView reloadData];
    [jsonString release];
}

@end
