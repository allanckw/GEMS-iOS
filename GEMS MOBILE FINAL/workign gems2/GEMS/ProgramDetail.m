//
//  ProgramDetail.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "ProgramDetail.h"

@implementation ProgramDetail

@synthesize programName, programStartDate, programStartTime,programEndDate, programEndTime, programDescription;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        self.programName = [json objectForKey:@"Name"];
        self.programStartDate = [json objectForKey:@"StartDate"];
        self.programStartTime = [json objectForKey:@"StartTime"];
        self.programEndDate = [json objectForKey:@"EndDate"];
        self.programEndTime= [json objectForKey:@"EndTime"];
        self.programDescription = [json objectForKey:@"Description"];

    }
    return self;
}


@end
