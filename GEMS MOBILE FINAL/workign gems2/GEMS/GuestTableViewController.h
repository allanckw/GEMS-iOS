//
//  GuestTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 17/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestTableViewController : UITableViewController
{
    NSMutableData *data;
}
@property (nonatomic, strong) NSNumber *eventID;
@property (nonatomic, retain) NSMutableArray *guest;
@property (nonatomic, retain) NSMutableArray *guestIDArray;
@property (nonatomic, retain) NSMutableArray *guestDateArray;

@end
