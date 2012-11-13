//
//  GuestList.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuestList : NSObject{
    NSNumber *guestKey;
    NSString *guestValue;
    NSString *guestDate;
}

@property (nonatomic, copy) NSNumber *guestKey;
@property (nonatomic, copy) NSString *guestValue;
@property (nonatomic, copy) NSString *guestDate;

-(id) initWithJSONDictionnary:(NSDictionary*)json;


@end
