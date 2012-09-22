//
//  GoogleBookService.h
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface GoogleBookService : NSObject{
    NSMutableArray *books;
    NSMutableData *data;
}

@property (nonatomic, retain) NSMutableArray *books;

-(void) PerformSearch:(NSString*)keyword;

@end
