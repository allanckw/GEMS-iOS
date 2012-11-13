//
//  GuestDetailViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestDetailViewController : UIViewController
{
    NSMutableData *data;
}

@property (nonatomic, strong) NSNumber *guestID;
@property (nonatomic, retain) IBOutlet UILabel *guestNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *guestDescriptionLabel;


@end
