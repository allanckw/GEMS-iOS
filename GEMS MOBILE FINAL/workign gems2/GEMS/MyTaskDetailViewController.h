//
//  MyTaskDetailViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTaskDetailViewController : UIViewController
{
    NSMutableData *data;
}

@property (nonatomic, retain) NSString *passphrase;
@property (nonatomic, strong) NSNumber *myTaskID;
@property (nonatomic, retain) IBOutlet UILabel *myTaskNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *myTaskDueDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *myTaskDueTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *myTaskDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *myTaskPercentDoneLabel;

@end
