//
//  ProgramList.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "ProgramList.h"

@implementation ProgramList

@synthesize programKey, programValue, programStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.programKey = [json objectForKey:@"Key"];
        self.programValue = [json objectForKey:@"Value"];
        self.programStartDate = [json objectForKey:@"StartDtae"];
    }
    return self;
}


@end
