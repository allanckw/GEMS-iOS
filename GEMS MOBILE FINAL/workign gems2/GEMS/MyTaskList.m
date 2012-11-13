//
//  MyTaskList.m
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "MyTaskList.h"

@implementation MyTaskList

@synthesize myTaskKey, myTaskValue, myTaskStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.myTaskKey = [json objectForKey:@"Key"];
        self.myTaskValue = [json objectForKey:@"Name"];
        self.myTaskStartDate = [json objectForKey:@"Date"];
    }
    return self;
}


@end
