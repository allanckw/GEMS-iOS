//
//  GoogleBookService.m
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GoogleBookService.h"
#import "Book.h"
#import "SBJson.h"

@implementation GoogleBookService

-(void) dealloc{
    [data release];
    [books release];
    [super dealloc];
}

-(void) PerformSearch:(NSString *)keyword{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"https://www.googleapis.com/books/v1/volumes?q=%@", keyword]];
    
    NSURLRequest *req =  [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    //Book *b = [[Book alloc] init];
    if (!connection){
        //
        NSLog(@"Error while starting connection!");
        [data release];
    
    }
    //else{
        //Get the book at specific index, in  this case index 0
   //     NSLog(@"ok");
   //     NSLog(url.absoluteString);
        //b = [books objectAtIndex:0];
   //}
    
    //return b;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData {
 //   int i=0;
    [data appendData:someData];
    
    //NSMutableData *d = [[NSMutableData data] retain];
    //[d appendData:data];
    
    //NSString *a = [[NSString alloc] initWithData:d encoding:NSASCIIStringEncoding];
    
    //NSLog(@"Data: %@", a);

}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [connection release];
    [data release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)conn {
    [conn release];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    

    
    NSArray* jsonItems = [[jsonString JSONValue] objectForKey:@"items"];
    
    NSDictionary *item;
    
    books = [[NSMutableArray alloc] init];
    for(item in jsonItems){
       Book* book = [[Book alloc]  initWithJSONDictionnary:item];
        [books addObject:book];
        
    }
    [jsonString release];
}


@end
