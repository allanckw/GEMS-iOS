//
//  MyTaskDetail.h
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTaskDetail : NSObject{
    NSString *myTaskName;
    NSString *myTaskDueDate;
    NSString *myTaskDueTime;
    NSString *myTaskDescription;
    NSNumber *myTaskPercentDone;
}

@property (nonatomic, copy) NSString *myTaskName;
@property (nonatomic, copy) NSString *myTaskDueDate;
@property (nonatomic, copy) NSString *myTaskDueTime;
@property (nonatomic, copy) NSString *myTaskDescription;
@property (nonatomic, copy) NSNumber *myTaskPercentDone;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
