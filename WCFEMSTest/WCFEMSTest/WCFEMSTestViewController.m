//
//  WCFEMSTestViewController.m
//  WCFEMSTest
//
//  Created by Wee Kwan Tan on 11/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//
#import "Service1.h"
#import "WCFEMSTestViewController.h"

@interface WCFEMSTestViewController ()


@end

@implementation WCFEMSTestViewController

NSMutableData *webData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


-(void)query
{
    
    //Web Service Call
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                             "<SOAP-ENV:Envelope \n"
                             "xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" \n"
                             "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \n"
                             "xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" \n"
                             "SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" \n"
                             "xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                             "<SOAP-ENV:Body> \n"
                             "<GetMembers xmlns=\"http://tempuri.org/\" \n"
                             "</GetMembers> \n"
                             "</SOAP-ENV:Body> \n"
                             "</SOAP-ENV:Envelope>"];


    NSURL *url = [NSURL URLWithString:@"http://invoicesafe.com/main0/Service1.svc"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue: @"http://tempuri.org/IService1/GetMembers" forHTTPHeaderField:@"Soapaction"];
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if(theConnection)
    {
          webData = [[NSMutableData data] retain];
    }
    else
    {
          NSLog(@"theConnection is NULL");
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    receive.text = [NSString stringWithFormat:@"Connection failed"];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [connection release];
  
    NSLog(@"Data has been loaded");
        
    NSString *responseString = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
    [webData release];

    receive =  responseString;
    NSLog(responseString);
    [responseString release];	
}

- (void)dealloc
{
    [super dealloc];
}

/*
-(void)query
{
    //[zip resignFirstResponder];
    
    BasicHttpBinding_IService1 *binding = [[Service1 BasicHttpBinding_IService1] initWithAddress:@"http://invoicesafe.com/main0/Service1.svc"];
    binding.logXMLInOut = YES;
    
    Service1_GetData *parms = [[Service1_GetData alloc] init];
    [f release];
    parms.value = self.send.text;
    [binding GetDataUsingDataContractAsyncUsingParameters:parms delegate:self];
    
    [parms release];
}

#pragma mark -
#pragma mark BasicHttpBinding_IService1ResponseDelegate methods
- (void) operation:(BasicHttpBinding_IService1Operation *)operation completedWithResponse:(BasicHttpBinding_IService1Response *)response
{
    [NSThread sleepForTimeInterval:5.0];
    
    // step 1 fill in the blanks.
    for (id mine in response.bodyParts)
    {
        if ([mine isKindOfClass:[BasicHttpBinding_IService1_GetData class]])
        {
            self.receive.text = [mine GetDataResult];
        }
    }
}
*/

@end
