//
//  MyTaskList.h
//  GEMS
//
//  Created by Wee Kwan Tan on 10/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTaskList : NSObject{
    NSNumber *myTaskKey;
    NSString *myTaskValue;
    NSString *myTaskStartDate;
}

@property (nonatomic, copy) NSNumber *myTaskKey;
@property (nonatomic, copy) NSString *myTaskValue;
@property (nonatomic, copy) NSString *myTaskStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
