//
//  EventTaskDetailViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTaskDetailViewController : UIViewController
{
    NSMutableData *data;
}

@property (nonatomic, retain) NSString *passphrase;
@property (nonatomic, strong) NSNumber *eventTaskID;
@property (nonatomic, retain) IBOutlet UILabel *eventTaskNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventTaskDueDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventTaskDueTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventTaskDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventTaskPercentDoneLabel;



@end
