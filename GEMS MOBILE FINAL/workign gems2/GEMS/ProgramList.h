//
//  ProgramList.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgramList : NSObject
{
    NSNumber *programKey;
    NSString *programValue;
    NSString *programStartDate;
}


@property (nonatomic, copy) NSNumber *programKey;
@property (nonatomic, copy) NSString *programValue;
@property (nonatomic, copy) NSString *programStartDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json;
@end
