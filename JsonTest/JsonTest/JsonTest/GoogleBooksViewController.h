//
//  GoogleBooksViewController.h
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoogleBookService.h"

@interface GoogleBooksViewController : UIViewController
{
    UIButton *btn;
    UITextField *input;
    UITextField *output;
}

@property (strong, nonatomic) IBOutlet UIButton *btn;
@property (strong, nonatomic) IBOutlet UITextField *input;
@property (strong, nonatomic) IBOutlet UITextField *output;

-(IBAction) query;
@end
