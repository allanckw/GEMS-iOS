//
//  EventTableViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol test;


@interface EventTableViewController : UITableViewController
{
    NSMutableData *data;
}

@property (strong, nonatomic) NSMutableDictionary *sections;
@property (strong, nonatomic) NSArray *sortedDays;
@property (strong, nonatomic) NSDateFormatter *sectionDateFormatter;
@property (strong, nonatomic) NSDateFormatter *cellDateFormatter;
@property (nonatomic, retain) NSMutableArray *eventSearchResult;
@property (nonatomic, retain) NSMutableArray *event;
@property (nonatomic, retain) NSNumber *eventID;
@property (nonatomic, retain) NSMutableArray *eventIDArray;
@property (nonatomic, retain) NSMutableArray *eventStartDateArray;
@property (nonatomic, retain) NSString *fromDate;
@property (nonatomic, retain) NSString *toDate;

@end
