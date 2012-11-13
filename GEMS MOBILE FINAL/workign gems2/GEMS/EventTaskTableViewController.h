//
//  EventTaskTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTaskTableViewController : UITableViewController
{
    NSMutableData *data;
}


@property (nonatomic, retain) NSString *passphrase;
@property (nonatomic, retain) NSNumber *eventID;
@property (nonatomic, retain) NSMutableArray *eventTask;
@property (nonatomic, retain) NSMutableArray *eventTaskIDArray;
@property (nonatomic, retain) NSMutableArray *eventTaskDateArray;


@end
