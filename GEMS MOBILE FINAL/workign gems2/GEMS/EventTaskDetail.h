//
//  EventTaskDetail.h
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventTaskDetail : NSObject{
    NSString *eventTaskName;
    NSString *eventTaskDueDate;
    NSString *eventTaskDueTime;
    NSString *eventTaskDescription;
    NSNumber *eventTaskPercentDone;
}

@property (nonatomic, copy) NSString *eventTaskName;
@property (nonatomic, copy) NSString *eventTaskDueDate;
@property (nonatomic, copy) NSString *eventTaskDueTime;
@property (nonatomic, copy) NSString *eventTaskDescription;
@property (nonatomic, copy) NSNumber *eventTaskPercentDone;

-(id) initWithJSONDictionnary:(NSDictionary*)json;


@end
