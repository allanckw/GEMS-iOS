//
//  EventTaskList.m
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventTaskList.h"

@implementation EventTaskList

@synthesize eventTaskKey, eventTaskValue, eventTaskStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.eventTaskKey = [json objectForKey:@"Key"];
        self.eventTaskValue = [json objectForKey:@"Name"];
        self.eventTaskStartDate = [json objectForKey:@"Date"];
    }
    return self;
}



@end
