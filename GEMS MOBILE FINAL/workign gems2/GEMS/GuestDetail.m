//
//  GuestDetail.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GuestDetail.h"

@implementation GuestDetail

@synthesize guestName, guestDescription;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.guestName = [json objectForKey:@"Name"];
        self.guestDescription = [json objectForKey:@"Description"];
    }
    return self;
}


@end
