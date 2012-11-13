//
//  GuestTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 17/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GuestTableViewController.h"
#import "GuestTableViewCell.h"
#import "GuestDetailViewController.h"
#import "EventDetailTabBarController.h"
#import "GuestList.h"
#import "SBJson.h"

@interface GuestTableViewController ()

@end

@implementation GuestTableViewController

@synthesize eventID, guest, guestIDArray, guestDateArray;

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
    guestIDArray = [[NSMutableArray alloc] init];
    eventID = [(EventDetailTabBarController *)self.parentViewController eventID];
    [self retrieveGuestList:eventID];

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
    return [self.guestDateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int countTemp = 0;
    // Return the number of rows in the section.
    for(int j = 0; j < self.guest.count; j++){
        
        GuestList *glist = [[GuestList alloc] init];
        glist = [guest objectAtIndex:j];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [guestDateArray objectAtIndex:section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = glist.guestDate;
        if([tempstr isEqualToString:tempstr2]){
            //if(plist.programStartDate== [programStartDateArray objectAtIndex:section]){
            countTemp = countTemp + 1;
        }
        
    }
    
    return countTemp;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.guestDateArray objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"guestTableCell";
    GuestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[GuestTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    int countTemp2 = 0;
    
    for(int k = 0; k < self.guest.count; k++){
        GuestList *glist = [[GuestList alloc] init];
        glist = [guest objectAtIndex:k];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [guestDateArray objectAtIndex:indexPath.section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = glist.guestDate;
        
        
        if([tempstr isEqualToString:tempstr2]){
            if (countTemp2 == indexPath.row) {
                
                cell.guestNameLabel.text = glist.guestValue;
                return  cell;
            }
            countTemp2++;
            
            
        }
    }
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
     [detailViewController release];
     */
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Go Guest Detail"])
    {
        // Get reference to the destination view controller
        GuestDetailViewController *targetVC = [segue destinationViewController];
        NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
        int countTemp2 = 0;
        
        for(int k = 0; k < self.guest.count; k++){
            GuestList *glist2 = [[GuestList alloc] init];
            glist2 = [guest objectAtIndex:k];
            
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [guestDateArray objectAtIndex:rowSelected.section];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = glist2.guestDate;
            
            
            if([tempstr isEqualToString:tempstr2]){
                
                if (countTemp2 == rowSelected.row) {
                    
                    targetVC.guestID = glist2.guestKey;
                    
                    return;
                }
                countTemp2++;
            }
        }
    }
}


-(void) retrieveGuestList:(NSNumber *)eid{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetEventGuests?eid=%@", eid]];
    
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
    guest = [[NSMutableArray alloc] init];
    guestDateArray = [[NSMutableArray alloc] init];
    for(item in jsonItems){
        GuestList* glist = [[GuestList alloc]  initWithJSONDictionnary:item];
        [guest addObject:glist];
        bool found = FALSE;
        
        for(int i=0;i< guestDateArray.count;i++)
        {
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [guestDateArray objectAtIndex:i];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = glist.guestDate;
            if([tempstr isEqualToString:tempstr2])
            {
                found = true;
            }
        }
        
        if(!found)
        {
            [guestDateArray addObject:glist.guestDate];
        }

    }
    
    [self.tableView reloadData];
    [jsonString release];
}

@end
