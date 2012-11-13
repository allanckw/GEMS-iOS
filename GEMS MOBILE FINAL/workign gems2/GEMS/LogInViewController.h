//
//  LogInViewController.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController{
    NSMutableData *data;
}

@property (nonatomic, strong) IBOutlet UITextField *usernameTextField;
@property (nonatomic, strong) IBOutlet UITextField *passwordTextField;
@property (nonatomic, retain) NSString *passphrase;
@property (nonatomic, retain) NSNumber *eventID;

@end
