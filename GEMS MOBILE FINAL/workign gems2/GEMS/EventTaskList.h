//
//  EventTaskList.h
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventTaskList : NSObject
{
    NSNumber *eventTaskKey;
    NSString *eventTaskValue;
    NSString *eventTaskStartDate;
}

@property (nonatomic, copy) NSNumber *eventTaskKey;
@property (nonatomic, copy) NSString *eventTaskValue;
@property (nonatomic, copy) NSString *eventTaskStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json;


@end
