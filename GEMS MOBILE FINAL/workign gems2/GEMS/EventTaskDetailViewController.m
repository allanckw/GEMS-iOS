//
//  EventTaskDetailViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventTaskDetailViewController.h"
#import "SBJson.h"
#import "EventTaskDetail.h"

@interface EventTaskDetailViewController ()

@end

@implementation EventTaskDetailViewController

@synthesize eventTaskID, passphrase;

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
    [self retrieveEventTask:passphrase:eventTaskID];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) retrieveEventTask:(NSString *)pphrase:(NSNumber *)etid{
    data = [[NSMutableData alloc] init];
    NSString *temp = [[NSString alloc] init];
    temp = [NSString stringWithFormat:@"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetTask?key=%@&taskID=%@",pphrase, etid];
    NSURL *url = [[NSURL alloc] initWithString:temp];
    
    
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
    EventTaskDetail* etdetail = [[EventTaskDetail alloc]  initWithJSONDictionnary:jsonItems];
    self.eventTaskNameLabel.text = etdetail.eventTaskName;
    self.eventTaskDueDateLabel.text = etdetail.eventTaskDueDate;
    self.eventTaskDueTimeLabel.text = etdetail.eventTaskDueTime;
    @try{
        self.eventTaskDescriptionLabel.text = etdetail.eventTaskDescription;
    }@catch (NSException *ex){
        self.eventTaskDescriptionLabel.text = @"";
    }
    self.eventTaskPercentDoneLabel.text = [etdetail.eventTaskPercentDone stringValue];
    [jsonString release];
}


@end
