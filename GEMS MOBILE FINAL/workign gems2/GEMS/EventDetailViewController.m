//
//  EventDetailViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 11/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "EventDetailViewController.h"
#import "EventDetail.h"
#import "EventTableViewController.h"
#import "EventDetailTabBarController.h"
#import "SBJson.h"
//#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>
//#import <Cocoa/Cocoa.h>
//#import <AppKit/NSWorkSpace.h>

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController

@synthesize eventID, mainView;

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
    eventID = [(EventDetailTabBarController *)self.parentViewController eventID];
    [self retrieveEvent:eventID];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) retrieveEvent:(NSNumber *)eid{
    data = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:
                                       @"http://54.251.39.56/GEMSsvc/evmsservice.svc/REST/GetEvent?eid=%@", eid]];
    
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
        EventDetail* edetail = [[EventDetail alloc]  initWithJSONDictionnary:jsonItems];
        self.eventNameLabel.text = edetail.eventName;
        self.eventStartDateLabel.text = edetail.eventStartDate;
        self.eventStartTimeLabel.text = edetail.eventStartTime;
        self.eventEndDateLabel.text = edetail.eventEndDate;
        self.eventEndTimeLabel.text = edetail.eventEndTime;
        self.eventDescriptionLabel.text = edetail.eventDescription;
        self.eventWebsiteLabel.text = edetail.eventWebsite;
    //[[NSWorkspace sharedWorkSpace] openURL:[NSURL edetail.eventWebsite]];
        self.eventPublicationRemarkLabel.text = edetail.eventPubRemarks;
        self.eventRegistrationLinkLabel.text = edetail.eventRegistrationLink;
    [jsonString release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	//See if touch was inside the label
	if (CGRectContainsPoint(self.eventWebsiteLabel.frame, [[[event allTouches] anyObject] locationInView:mainView]))
	{
		//Open webpage
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.eventWebsiteLabel.text]];
	}
    else if (CGRectContainsPoint(self.eventRegistrationLinkLabel.frame, [[[event allTouches] anyObject] locationInView:mainView]))
	{
		//Open webpage
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.eventRegistrationLinkLabel.text]];
	}

}


@end
