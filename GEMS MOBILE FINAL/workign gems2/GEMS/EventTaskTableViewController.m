//
//  EventTaskTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventTaskTableViewController.h"
#import "EventTaskTableViewCell.h"
#import "EventTaskDetailViewController.h"
#import "TaskDetailTabBarController.h"
#import "EventTaskList.h"
#import "SBJson.h"

@interface EventTaskTableViewController ()

@end

@implementation EventTaskTableViewController

@synthesize eventID, passphrase, eventTask, eventTaskDateArray, eventTaskIDArray;

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
    
    
    
    eventID = [(TaskDetailTabBarController *)self.parentViewController eventID];
    passphrase = [(TaskDetailTabBarController *)self.parentViewController passphrase];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    //[super viewDidLoad];
    //eventStartDateArray = [[NSMutableArray alloc] init];
    [self retrieveEventTaskList:passphrase:eventID];
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
    return [self.eventTaskDateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int countTemp = 0;
    // Return the number of rows in the section.
    for(int j = 0; j < self.eventTask.count; j++){
        
        EventTaskList *etlist = [[EventTaskList alloc] init];
        etlist = [eventTask objectAtIndex:j];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [eventTaskDateArray objectAtIndex:section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = etlist.eventTaskStartDate;
        if([tempstr isEqualToString:tempstr2]){
            //if(plist.programStartDate== [programStartDateArray objectAtIndex:section]){
            countTemp = countTemp + 1;
        }
        
    }
    
    return countTemp;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.eventTaskDateArray objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"eventTaskTableCell";
    EventTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[EventTaskTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    int countTemp2 = 0;
    
    for(int k = 0; k < self.eventTask.count; k++){
        
        EventTaskList *etlist = [[EventTaskList alloc] init];
        etlist = [eventTask objectAtIndex:k];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [eventTaskDateArray objectAtIndex:indexPath.section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = etlist.eventTaskStartDate;
        
        
        if([tempstr isEqualToString:tempstr2]){
            if (countTemp2 == indexPath.row) {
                cell.eventTaskNameLabel.text = etlist.eventTaskValue;
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
    if ([[segue identifier] isEqualToString:@"Go Event Task Detail"])
    {
        // Get reference to the destination view controller
        EventTaskDetailViewController *targetVC = [segue destinationViewController];
        NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
        int countTemp2 = 0;
        targetVC.passphrase = passphrase;
        for(int k = 0; k < self.eventTask.count; k++){
            EventTaskList *etlist2 = [[EventTaskList alloc] init];
            etlist2 = [eventTask objectAtIndex:k];
            
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [eventTaskDateArray objectAtIndex:rowSelected.section];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = etlist2.eventTaskStartDate;
            
            
            if([tempstr isEqualToString:tempstr2]){
                
                if (countTemp2 == rowSelected.row) {
                    
                    targetVC.eventTaskID = etlist2.eventTaskKey;
                    
                    return;
                }
                countTemp2++;
                
                
            }
        }
        
        //targetVC.programID = [programIDArray objectAtIndex:rowSelected.row];
        // Pass any objects to the view controller here, like...
    }
}


-(void) retrieveEventTaskList:(NSString *)pphrase:(NSNumber *)eid{
    data = [[NSMutableData alloc] init];
    NSString *temp = [[NSString alloc] init];
    temp = [NSString stringWithFormat:@"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/ViewEventTask?key=%@&eventID=%@",pphrase, eid];
    NSURL *url = [[NSURL alloc] initWithString:temp];
    
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
    eventTask = [[NSMutableArray alloc] init];
    eventTaskDateArray = [[NSMutableArray alloc] init];
   
    NSRange range = [jsonString rangeOfString:@"<?xml"];
    
    if(range.location == 0)
    {
        UIAlertView* alrt = [[UIAlertView alloc]
                             initWithTitle:@"Error!" message:@"Not authorized to view" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alrt show];
        [alrt release];
    }
    else
    {
    
    for(item in jsonItems){
        EventTaskList* etlist = [[EventTaskList alloc]  initWithJSONDictionnary:item];
        [eventTask addObject:etlist];
        bool found = FALSE;
    
        for(int i=0;i<eventTaskDateArray.count;i++)
        {
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [eventTaskDateArray objectAtIndex:i];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = etlist.eventTaskStartDate;
            if([tempstr isEqualToString:tempstr2])
            {
                found = true;
            }
        }
        
        if(!found)
        {
            [eventTaskDateArray addObject:etlist.eventTaskStartDate];
        }
        
    }
        
    
}

        

    

    
    [self.tableView reloadData];
    [jsonString release];
}


@end
