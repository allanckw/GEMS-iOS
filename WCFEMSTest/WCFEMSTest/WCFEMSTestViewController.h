//
//  WCFEMSTestViewController.h
//  WCFEMSTest
//
//  Created by Wee Kwan Tan on 11/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCFEMSTestViewController : UIViewController
{
    UITextField *send;
    UITextField *receive;
}

@property (nonatomic, retain) IBOutlet UITextField *send;
@property (nonatomic, retain) IBOutlet UITextField *receive;

-(IBAction)query;
-(void)connection;
-(void)connectionDidFinishLoading;
-(void)dealloc;

@end
