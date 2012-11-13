//
//  GuestDetailViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GuestDetailViewController.h"
#import "GuestDetail.h"
#import "SBJson.h"

@interface GuestDetailViewController ()

@end

@implementation GuestDetailViewController

@synthesize guestID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self retrieveGuest:guestID];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) retrieveGuest:(NSNumber *)gid{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetGuest?gid=%@", gid]];
    
    NSURLRequest *req =  [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (!connection){
        NSLog(@"Error while starting connection!");
        [data release];
        
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response{
    [data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData {
    [data appendData:someData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [connection release];
    [data release];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)conn {
    [conn release];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    [data release];
    //NSDictionary *item;
    
    NSDictionary* jsonItems = [jsonString JSONValue];;
    //for(item in jsonItems){
    GuestDetail* gdetail = [[GuestDetail alloc]  initWithJSONDictionnary:jsonItems];
    self.guestNameLabel.text = gdetail.guestName;
    self.guestDescriptionLabel.text = gdetail.guestDescription;
    [jsonString release];
}


@end
