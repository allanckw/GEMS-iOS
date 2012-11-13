//
//  GuestDetail.h
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GuestDetail : NSObject{

    NSString *guestName;
    NSString *guestDescription;
}

@property (nonatomic, copy) NSString *guestName;
@property (nonatomic, copy) NSString *guestDescription;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
