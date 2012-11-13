//
//  EventDetailTabBarController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventDetailTabBarController.h"
#import "LogInViewController.h"

@interface EventDetailTabBarController ()

@end

@implementation EventDetailTabBarController
@synthesize eventID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Go Login"])
    {
        // Get reference to the destination view controller
        LogInViewController *targetVC = [segue destinationViewController];
        // Pass any objects to the view controller here, like...
        targetVC.eventID = [self eventID];
    }
}

@end
