//
//  Event.h
//  GEMS
//
//  Created by Wee Kwan Tan on 30/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDetail : NSObject{
    NSString *eventName;
    NSString *eventStartDate;
    NSString *eventStartTime;
    NSString *eventEndDate;
    NSString *eventEndTime;
    NSString *eventDescription;
    NSURL *eventWebsite;
    NSString *eventPubRemarks;
    NSURL *eventRegistrationLink;
}

@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *eventStartDate;
@property (nonatomic, copy) NSString *eventStartTime;
@property (nonatomic, copy) NSString *eventEndDate;
@property (nonatomic, copy) NSString *eventEndTime;
@property (nonatomic, copy) NSString *eventDescription;
@property (nonatomic, retain) NSURL *eventWebsite;
@property (nonatomic, retain) NSString *eventPubRemarks;
@property (nonatomic, copy) NSURL *eventRegistrationLink;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
