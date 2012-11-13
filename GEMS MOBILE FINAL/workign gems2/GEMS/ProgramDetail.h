//
//  ProgramDetail.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProgramDetail : NSObject{
    NSString *programName;
    NSString *programStartDate;
    NSString *programStartTime;
    NSString *programEndDate;
    NSString *programEndTime;
    NSString *programDescription;
}

@property (nonatomic, copy) NSString *programName;
@property (nonatomic, copy) NSString *programStartDate;
@property (nonatomic, copy) NSString *programStartTime;
@property (nonatomic, copy) NSString *programEndDate;
@property (nonatomic, copy) NSString *programEndTime;
@property (nonatomic, copy) NSString *programDescription;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
