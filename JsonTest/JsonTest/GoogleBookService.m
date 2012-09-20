//
//  GoogleBookService.m
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GoogleBookService.h"
#import "GoogleBooksViewController.h"
#import "Book.h"
#import "SBJson.h"

@implementation GoogleBookService

-(void) dealloc{
    [data release];
    [books release];
    [super dealloc];
}

-(Book*) PerformSearch:(NSString *)keyword{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"https://wwww.googleapis.com/books/v1/volumes?q=%@", keyword]];
    
    NSURLRequest *req =  [NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    Book *b = [[Book alloc] init];
    if (!conn){
        //
        //NSLOG(@"Error while starting connection!");
        [data release];
    
    }else{
        //Get the book at specific index, in  this case index 0
        b = [books objectAtIndex:0];
    }
    
    return b;
}

-(void)conn:(NSURLConnection *)conn didReceiveResponse:(NSURLResponse *) response{
    [data setLength:0];
}

-(void)conn:(NSURLConnection *)conn didReceiveData:(NSData *)someData {
    [data appendData:someData];
}

-(void)conn:(NSURLConnection *)conn didFailWithError:(NSError *)error
{
    [conn release];
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
       // Book* book = [[Book alloc]  initWithJSONDictionnary:item];
        //[books addObject:book];
        
    }
    [jsonString release];
}


@end
