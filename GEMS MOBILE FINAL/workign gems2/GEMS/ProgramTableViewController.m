//
//  ProgramTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "ProgramTableViewController.h"
#import "ProgramTableViewCell.h"
#import "EventDetailTabBarController.h"
#import "ProgramDetailViewController.h"
#import "ProgramList.h"
#import "SBJson.h"

@interface ProgramTableViewController ()

@end

@implementation ProgramTableViewController

@synthesize eventID, program, programIDArray, programStartDateArray;

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
    programIDArray = [[NSMutableArray alloc] init];
    eventID = [(EventDetailTabBarController *)self.parentViewController eventID];
    [self retrieveProgramList:eventID];

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
    return [self.programStartDateArray count];
;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int countTemp = 0;
    // Return the number of rows in the section.
    for(int j = 0; j < self.program.count; j++){
        
        ProgramList *plist = [[ProgramList alloc] init];
        plist = [program objectAtIndex:j];

        NSString* tempstr = [[NSString alloc] init];
        tempstr = [programStartDateArray objectAtIndex:section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = plist.programStartDate;
        if([tempstr isEqualToString:tempstr2]){
        //if(plist.programStartDate== [programStartDateArray objectAtIndex:section]){
            countTemp = countTemp + 1;
        }
        
    }
    
    return countTemp;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.programStartDateArray objectAtIndex:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"programTableCell";
    
    ProgramTableViewCell *cell = [tableView
                                dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ProgramTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    int countTemp2 = 0;
    
    for(int k = 0; k < self.program.count; k++){
        
        ProgramList *plist = [[ProgramList alloc] init];
        plist = [program objectAtIndex:k];
        
        NSString* tempstr = [[NSString alloc] init];
        tempstr = [programStartDateArray objectAtIndex:indexPath.section];
        
        NSString* tempstr2 = [[NSString alloc] init];
        tempstr2 = plist.programStartDate;

        
        if([tempstr isEqualToString:tempstr2]){  
            if (countTemp2 == indexPath.row) {
                
                cell.programNameLabel.text = plist.programValue;
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
     // ..."
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Go Program Detail"])
    {
        // Get reference to the destination view controller
        ProgramDetailViewController *targetVC = [segue destinationViewController];
        NSIndexPath *rowSelected = [self.tableView indexPathForSelectedRow];
        int countTemp2 = 0;
        
        for(int k = 0; k < self.program.count; k++){
            ProgramList *plist2 = [[ProgramList alloc] init];
            plist2 = [program objectAtIndex:k];
            
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [programStartDateArray objectAtIndex:rowSelected.section];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = plist2.programStartDate;

            
            if([tempstr isEqualToString:tempstr2]){
                
                if (countTemp2 == rowSelected.row) {
                    
                    targetVC.programID = plist2.programKey;
                    
                    return;
                }
                countTemp2++;
                
                
            }
        }

        //targetVC.programID = [programIDArray objectAtIndex:rowSelected.row];
        // Pass any objects to the view controller here, like...
    }
}


-(void) retrieveProgramList:(NSNumber *)eid{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetEventProgs?eid=%@", eid]];
    
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
    program = [[NSMutableArray alloc] init];
    programStartDateArray = [[NSMutableArray alloc] init];
    for(item in jsonItems){
        ProgramList* plist = [[ProgramList alloc]  initWithJSONDictionnary:item];
        [program addObject:plist];
        bool found = FALSE;
        
        for(int i=0;i<programStartDateArray.count;i++)
        {
            NSString* tempstr = [[NSString alloc] init];
            tempstr = [programStartDateArray objectAtIndex:i];
            
            NSString* tempstr2 = [[NSString alloc] init];
            tempstr2 = plist.programStartDate;
            if([tempstr isEqualToString:tempstr2])
            {
                found = true;
            }
        }
        
        if(!found)
        {
        [programStartDateArray addObject:plist.programStartDate];
        }

    }
    
    [self.tableView reloadData];
    [jsonString release];
}


@end
