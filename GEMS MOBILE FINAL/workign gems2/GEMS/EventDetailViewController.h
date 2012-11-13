//
//  EventDetailViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailViewController : UIViewController
{
    NSMutableData *data;
}

@property (nonatomic, strong) NSNumber *eventID;
@property (nonatomic, retain) IBOutlet UILabel *eventNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventStartDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventStartTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventEndDateLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventEndTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventWebsiteLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventPublicationRemarkLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventRegistrationLinkLabel;
@property (nonatomic, retain) IBOutlet UIView *mainView;


@end
