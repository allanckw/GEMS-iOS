//
//  EventList.m
//  GEMS
//
//  Created by Wee Kwan Tan on 30/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventList.h"

@implementation EventList

@synthesize eventKey, eventValue, eventStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.eventKey = [json objectForKey:@"Key"];
        self.eventValue = [json objectForKey:@"Value"];
        self.eventStartDate = [json objectForKey:@"StartDate"];
    }
    return self;
}


@end
