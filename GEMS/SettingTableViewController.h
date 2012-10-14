//
//  SettingTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 14/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewController : UITableViewController
{
@private
	UIDatePicker *pickerView;
	UIBarButtonItem *doneButton;	// this button appears only when the date picker is open
	NSArray *dataArray;
	NSDateFormatter *dateFormatter;

}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) NSArray *dataArray; 
@property (nonatomic, retain) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)doneAction:(id)sender;	// when the done button is clicked
- (IBAction)dateAction:(id)sender;	// when the user has changed the date picke values (m/d/y)
@end
