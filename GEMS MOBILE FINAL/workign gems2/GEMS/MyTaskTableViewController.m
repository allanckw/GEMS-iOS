//
//  MyTaskTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "MyTaskTableViewController.h"
#import "MyTaskTableViewCell.h"
#import "MyTaskDetailViewController.h"
#import "TaskDetailTabBarController.h"
#import "MyTaskList.h"
#import "SBJson.h"

@interface MyTaskTableViewController ()

@end

@implementation MyTaskTableViewController

@synthesize eventID, passphrase, myTask, myTaskDateArray, myTaskIDArray;

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
    [self retrieveMyTaskList:passphrase:eventID];

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
    return [self.myTaskDateArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int countTemp = 0;
    // Return the number of rows in the section.
    for(int j = 0; j < self.myTask.count; j++){
        
        MyTaskList *mtlist = [[MyTaskList alloc] init];
        mtlist = [myTask objectAtIndex:j];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [myTaskDateArray objectAtIndex:section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = mtlist.myTaskStartDate;
        if([tempstr isEqualToString:tempstr2]){
            //if(plist.programStartDate== [programStartDateArray objectAtIndex:section]){
            countTemp = countTemp + 1;
        }
        
    }
    
    return countTemp;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.myTaskDateArray objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"myTaskTableCell";
    MyTaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MyTaskTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    int countTemp2 = 0;
    
    for(int k = 0; k < self.myTask.count; k++){
        
        MyTaskList *mtlist = [[MyTaskList alloc] init];
        mtlist = [myTask objectAtIndex:k];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [myTaskDateArray objectAtIndex:indexPath.section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = mtlist.myTaskStartDate;
        
        
        if([tempstr isEqualToString:tempstr2]){
            if (countTemp2 == indexPath.row) {
                cell.myTaskNameLabel.text = mtlist.myTaskValue;
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
    if ([[segue identifier] isEqualToString:@"Go My Task Detail"])
    {
        // Get reference to the destination view controller
        MyTaskDetailViewController *targetVC = [segue destinationViewController];
        NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
        int countTemp2 = 0;
        targetVC.passphrase = passphrase;
        for(int k = 0; k < self.myTask.count; k++){
            MyTaskList *mtlist2 = [[MyTaskList alloc] init];
            mtlist2 = [myTask objectAtIndex:k];
            
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [myTaskDateArray objectAtIndex:rowSelected.section];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = mtlist2.myTaskStartDate;
            
            
            if([tempstr isEqualToString:tempstr2]){
                
                if (countTemp2 == rowSelected.row) {
                    
                    targetVC.myTaskID = mtlist2.myTaskKey;
                    
                    return;
                }
                countTemp2++;
            
                
            }
        }
        
        //targetVC.programID = [programIDArray objectAtIndex:rowSelected.row];
        // Pass any objects to the view controller here, like...
    }
}


-(void) retrieveMyTaskList:(NSString *)pphrase:(NSNumber *)eid{
    data = [[NSMutableData alloc] init];
    NSString *temp = [[NSString alloc] init];
    temp = [NSString stringWithFormat:@"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/ViewMyTask?key=%@&eventID=%@",pphrase, eid];
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
    myTask = [[NSMutableArray alloc] init];
    myTaskDateArray = [[NSMutableArray alloc] init];
            
    for(item in jsonItems){
        MyTaskList* mtlist = [[MyTaskList alloc]  initWithJSONDictionnary:item];
        [myTask addObject:mtlist];
        bool found = FALSE;
            
        for(int i=0;i<myTaskDateArray.count;i++)
        {
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [myTaskDateArray objectAtIndex:i];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = mtlist.myTaskStartDate;
            if([tempstr isEqualToString:tempstr2])
            {
                found = true;
            }
        }
        
        if(!found)
        {
            [myTaskDateArray addObject:mtlist.myTaskStartDate];
        }
            
    }
    
    [self.tableView reloadData];
    
    [jsonString release];
}


@end
