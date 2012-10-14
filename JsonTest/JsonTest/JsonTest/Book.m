//
//  Book.m
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize title, desc, smallThumbnail, url;

-(id) initWithJSONDictionnary:(NSDictionary*)json {
    self = [super init];
    if (self) {
        NSDictionary* volumeInfo = [json objectForKey:@"volumeInfo"];
        self.title = [volumeInfo objectForKey:@"title"];
        self.desc = [volumeInfo objectForKey:@"description"];
        
        NSString* path = [[volumeInfo objectForKey:@"imageLinks"] objectForKey:@"smallThumbnail"];
        UIImage* image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
        self.smallThumbnail = image;
        [image release];
        
        self.url = [NSURL URLWithString:[volumeInfo objectForKey:@"previewLink"]];
    }
    return self;
}

-(void) dealloc {
    [url release];
    [desc release];
    [title release];
    [smallThumbnail release];
    [super dealloc];
}

@end
