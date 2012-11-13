//
//  ProgramTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramTableViewController : UITableViewController
{
    NSMutableData *data;
}
@property (nonatomic, strong) NSNumber *eventID;
@property (nonatomic, retain) NSMutableArray *program;
@property (nonatomic, retain) NSMutableArray *programIDArray;
@property (nonatomic, retain) NSMutableArray *programStartDateArray;

@end
