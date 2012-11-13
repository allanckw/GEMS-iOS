//
//  GuestList.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GuestList.h"

@implementation GuestList

@synthesize guestKey, guestValue, guestDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.guestKey = [json objectForKey:@"Key"];
        self.guestValue = [json objectForKey:@"Value"];
        self.guestDate = [json objectForKey:@"Date"];
    }
    return self;
}


@end
