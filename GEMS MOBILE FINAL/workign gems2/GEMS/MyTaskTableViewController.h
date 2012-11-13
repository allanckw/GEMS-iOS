//
//  MyTaskTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTaskTableViewController : UITableViewController
{
    NSMutableData *data;
}


@property (nonatomic, retain) NSString *passphrase;
@property (nonatomic, retain) NSNumber *eventID;
@property (nonatomic, retain) NSMutableArray *myTask;
@property (nonatomic, retain) NSMutableArray *myTaskIDArray;
@property (nonatomic, retain) NSMutableArray *myTaskDateArray;


@end
