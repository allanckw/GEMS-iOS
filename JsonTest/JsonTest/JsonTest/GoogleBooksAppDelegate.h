//
//  GoogleBooksAppDelegate.h
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoogleBooksViewController;

@interface GoogleBooksAppDelegate : UIResponder <UIApplicationDelegate> 

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GoogleBooksViewController *viewController;

@end
