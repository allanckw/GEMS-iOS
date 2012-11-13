//
//  ProgramDetailViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "ProgramDetailViewController.h"
#import "ProgramDetail.h"
#import "SBJson.h"

@interface ProgramDetailViewController ()

@end

@implementation ProgramDetailViewController

@synthesize programID;

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
    [self retrieveProgram:programID];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) retrieveProgram:(NSNumber *)pid{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetProg?pid=%@", pid]];
    
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
    ProgramDetail* pdetail = [[ProgramDetail alloc]  initWithJSONDictionnary:jsonItems];
    self.programNameLabel.text = pdetail.programName;
    self.programStartDateLabel.text = pdetail.programStartDate;
    self.programStartTimeLabel.text = pdetail.programStartTime;
    self.programEndDateLabel.text = pdetail.programEndDate;
    self.programEndTimeLabel.text = pdetail.programEndTime;
    @try{
        self.programDescriptionLabel.text = pdetail.programDescription;
    }@catch (NSException *ex){
        self.programDescriptionLabel.text = @"";
    }
    [jsonString release];
}


@end
