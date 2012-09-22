//
//  Book.h
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject {
    NSString *title;
    NSString *desc;
    UIImage *smallThumbnail;
    NSURL *url;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, retain) UIImage *smallThumbnail;
@property (nonatomic, retain) NSURL *url;

-(id) initWithJSONDictionnary:(NSDictionary*)json;

@end
