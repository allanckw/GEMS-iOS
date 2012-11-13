//
//  Event.m
//  GEMS
//
//  Created by Wee Kwan Tan on 30/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventDetail.h"

@implementation EventDetail

@synthesize eventName, eventStartDate, eventStartTime, eventEndDate, eventEndTime,eventDescription, eventWebsite, eventPubRemarks, eventRegistrationLink;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.eventName = [json objectForKey:@"Name"];
        self.eventStartDate = [json objectForKey:@"StartDate"];
        self.eventStartTime = [json objectForKey:@"StartTime"];
        self.eventEndDate = [json objectForKey:@"EndDate"];
        self.eventEndTime = [json objectForKey:@"EndTime"];
        self.eventDescription = [json objectForKey:@"Description"];
        self.eventWebsite = [json objectForKey:@"Website"];
        self.eventPubRemarks = [json objectForKey:@"PublicationRemarks"];
        self.eventRegistrationLink = [json objectForKey:@"Registration"];

    }
    return self;
}
@end
