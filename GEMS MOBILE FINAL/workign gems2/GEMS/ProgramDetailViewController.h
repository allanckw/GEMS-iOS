//
//  ProgramDetailViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramDetailViewController : UIViewController
{
    NSMutableData *data;
}

@property (nonatomic, strong) NSNumber *programID;
@property (nonatomic, retain) IBOutlet UILabel *programNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *programStartDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *programStartTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *programEndDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *programEndTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *programDescriptionLabel;


@end
