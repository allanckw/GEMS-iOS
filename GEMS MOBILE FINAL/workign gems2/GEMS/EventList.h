//
//  EventList.h
//  GEMS
//
//  Created by Wee Kwan Tan on 30/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventList : NSObject{
    NSNumber *eventKey;
    NSString *eventValue;
    NSString *eventStartDate;
}

@property (nonatomic, copy) NSNumber *eventKey;
@property (nonatomic, copy) NSString *eventValue;
@property (nonatomic, copy) NSString *eventStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
