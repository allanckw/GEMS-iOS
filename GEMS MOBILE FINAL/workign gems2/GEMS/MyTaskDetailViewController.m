//
//  MyTaskDetailViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 6/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "MyTaskDetailViewController.h"
#import "MyTaskDetail.h"
#import "SBJson.h"

@interface MyTaskDetailViewController ()

@end

@implementation MyTaskDetailViewController

@synthesize myTaskID, passphrase;

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
    [self retrieveMyTask:passphrase:myTaskID];

	// Do any additional setup after loading the view.
}

    //[self retrieveMyTask:passphrase:myTaskID];}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) retrieveMyTask:(NSString *)pphrase:(NSNumber *)mtid{
    data = [[NSMutableData alloc] init];
    NSString *temp = [[NSString alloc] init];
    temp = [NSString stringWithFormat:@"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetTask?key=%@&taskID=%@",pphrase, mtid];
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
    MyTaskDetail* mtdetail = [[MyTaskDetail alloc]  initWithJSONDictionnary:jsonItems];
    self.myTaskNameLabel.text = mtdetail.myTaskName;
    self.myTaskDueDateLabel.text = mtdetail.myTaskDueDate;
    self.myTaskDueTimeLabel.text = mtdetail.myTaskDueTime;
    @try{
        self.myTaskDescriptionLabel.text = mtdetail.myTaskDescription;
    }@catch (NSException *ex){
        self.myTaskDescriptionLabel.text = @"";
    }
    self.myTaskPercentDoneLabel.text = [mtdetail.myTaskPercentDone stringValue];
    
    
    [jsonString release];
    
}

@end
