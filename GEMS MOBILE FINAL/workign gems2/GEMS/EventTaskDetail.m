//
//  EventTaskDetail.m
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventTaskDetail.h"

@implementation EventTaskDetail

@synthesize eventTaskName, eventTaskDueDate, eventTaskDueTime, eventTaskDescription, eventTaskPercentDone;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.eventTaskName = [json objectForKey:@"Name"];
        self.eventTaskDueDate = [json objectForKey:@"DueDate"];
        self.eventTaskDueTime = [json objectForKey:@"DueTime"];
        self.eventTaskDescription = [json objectForKey:@"Description"];
        self.eventTaskPercentDone = [json objectForKey:@"PercentageCompleted"];
    }
    return self;
}

@end
