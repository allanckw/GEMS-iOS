//
//  SettingTableViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 14/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "EventTableViewController.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

@synthesize datePicker, doneButton, dataArray, dateFormatter, par;


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
    self.dataArray = [NSArray arrayWithObjects:@"Start Date", @"End Date", nil];
	
    NSDateFormatter *currentDate = [[NSDateFormatter alloc] init];
    [currentDate setDateFormat:@"yyyy-MM-dd"];
    
	//currentDate = [[[NSDateFormatter alloc] init] autorelease];
	[currentDate setDateStyle:NSDateFormatterShortStyle];
	//[currentDate setTimeStyle:NSDateFormatterNoStyle];
}

- (void)viewDidUnload
{
	self.dataArray = nil;
	self.dateFormatter = nil;
}

- (void)dealloc
{
    [doneButton release];
	[dataArray release];
	[datePicker release];
	[dateFormatter release];
	
	[super dealloc];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.dataArray count];
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
    
    NSDateFormatter *currentDate = [[NSDateFormatter alloc] init];
    [currentDate setDateFormat:@"yyyy-MM-dd"];
    
    UITableViewCell *targetCell = [tableView cellForRowAtIndexPath:indexPath];
    if ( indexPath.section == 0 )
    {
        if ( indexPath.row == 0 || indexPath.row == 1)
        {
            self.datePicker.date = [currentDate dateFromString:targetCell.detailTextLabel.text];
            
            // check if our date picker is already on screen
            if (self.datePicker.superview == nil)
            {
                [self.view.window addSubview: self.datePicker];
                // size up the picker view to our screen and compute the start/end frame origin for our slide up animation
                //
                // compute the start frame
                
                CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
                CGSize pickerSize = [self.datePicker sizeThatFits:CGSizeZero];
                CGRect startRect = CGRectMake(0.0,
                                              screenRect.origin.y + screenRect.size.height,
                                              pickerSize.width, pickerSize.height);
                self.datePicker.frame = startRect;
                
                // compute the end frame
                CGRect pickerRect = CGRectMake(0.0,
                                               screenRect.origin.y + screenRect.size.height - pickerSize.height,
                                               pickerSize.width,
                                               pickerSize.height);
                // start the slide up animation
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0.3];
                
                // we need to perform some post operations after the animation is complete
                [UIView setAnimationDelegate:self];
                
                self.datePicker.frame = pickerRect;
                
                // shrink the table vertical size to make room for the date picker
                CGRect newFrame = self.tableView.frame;
                newFrame.size.height -= self.datePicker.frame.size.height;
                self.tableView.frame = newFrame;
                [UIView commitAnimations];
                
                // add the "Done" button to the nav bar
                
                self.navigationItem.rightBarButtonItem = self.doneButton;
            }
        }
        else
        {
        }
        
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
	}
    
    NSDateFormatter *currentDate = [[NSDateFormatter alloc] init];
    [currentDate setDateFormat:@"yyyy-MM-dd"];
    
	cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        cell.detailTextLabel.text = [currentDate stringFromDate:[NSDate date]];
        par.fromDate = cell.detailTextLabel.text;
    }else if(indexPath.row == 1){
        cell.detailTextLabel.text = [currentDate stringFromDate:[NSDate date]];
        par.toDate = cell.detailTextLabel.text;
    }
    //else0
    //   cell.detailTextLabel.text =
    
    return cell;
}


- (void)slideDownDidStop
{
	// the date picker has finished sliding downwards, so remove it
	[self.datePicker removeFromSuperview];
}


- (IBAction)dateAction:(id)sender
{
    NSDateFormatter *currentDate = [[NSDateFormatter alloc] init];
    [currentDate setDateFormat:@"yyyy-MM-dd"];

	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    if(indexPath.row == 0){
        cell.detailTextLabel.text = [currentDate stringFromDate:self.datePicker.date];
        par.fromDate = cell.detailTextLabel.text;
    }else if(indexPath.row == 1){
        cell.detailTextLabel.text = [currentDate stringFromDate:self.datePicker.date];
        par.toDate = cell.detailTextLabel.text;
    }
}


- (IBAction)doneAction:(id)sender
{
	CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect endFrame = self.datePicker.frame;
	endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
	
	// start the slide down animation
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
	
    // we need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(slideDownDidStop)];
	
    self.datePicker.frame = endFrame;
	[UIView commitAnimations];
	
	// grow the table back again in vertical size to make room for the date picker
	CGRect newFrame = self.tableView.frame;
	newFrame.size.height += self.datePicker.frame.size.height;
	self.tableView.frame = newFrame;
	
	// remove the "Done" button in the nav bar
	self.navigationItem.rightBarButtonItem = nil;
	
	// deselect the current table row
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (IBAction)searchEvent{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect endFrame = self.datePicker.frame;
	endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
	
	// start the slide down animation
	[UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
	
    // we need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(slideDownDidStop)];
	
    self.datePicker.frame = endFrame;
	[UIView commitAnimations];
	
	// grow the table back again in vertical size to make room for the date picker
	CGRect newFrame = self.tableView.frame;
	newFrame.size.height += self.datePicker.frame.size.height;
	self.tableView.frame = newFrame;
	
	// remove the "Done" button in the nav bar
	self.navigationItem.rightBarButtonItem = nil;
	
	// deselect the current table row
	NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Search Results"])
    {
        EventTableViewController *targetVC = [segue destinationViewController];
        targetVC.fromDate = self.par.fromDate;
        targetVC.toDate = self.par.toDate;
    }
}



@end
