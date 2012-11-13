//
//  MyTaskDetail.m
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "MyTaskDetail.h"

@implementation MyTaskDetail

@synthesize myTaskName, myTaskDueDate, myTaskDueTime, myTaskDescription, myTaskPercentDone;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.myTaskName = [json objectForKey:@"Name"];
        self.myTaskDueDate = [json objectForKey:@"DueDate"];
        self.myTaskDueTime = [json objectForKey:@"DueTime"];
        self.myTaskDescription = [json objectForKey:@"Description"];
        self.myTaskPercentDone = [json objectForKey:@"PercentageCompleted"];
    }
    return self;
}

@end
