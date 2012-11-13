//
//  LogInViewController.m
//  GEMS
//
//  Created by Wee Kwan Tan on 3/11/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "LogInViewController.h"
#import "TaskDetailTabBarController.h"
#import "EventDetailTabBarController.h"
#import "StringEncryption.h"
#import "NSData+Base64.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

@synthesize passwordTextField, usernameTextField, passphrase, eventID;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login{
    NSString *_secret = [[NSString alloc] init];
    NSString *username = [[NSString alloc] init];
    _secret = passwordTextField.text;
    username = usernameTextField.text;
	NSString * _key = @"2759190468791611";
	
	StringEncryption *crypto = [[[StringEncryption alloc] init] autorelease];
	NSData *_secretData = [_secret dataUsingEncoding:NSUTF8StringEncoding];
	CCOptions padding = kCCOptionPKCS7Padding;
	NSData *encryptedData = [crypto encrypt:_secretData key:[_key dataUsingEncoding:NSUTF8StringEncoding] padding:&padding];
	//NSString *str = [[NSString alloc] initWithData:encryptedData encoding:NSUTF8StringEncoding];
    NSLog(@"encrypted data in hex: %@", encryptedData);

    data = [[NSMutableData alloc] init];                                       
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://54.251.39.56/GEMSsvc/Evmsservice.svc/REST/Auth?uid=%@&pwd=%@", username, [encryptedData base64EncodingWithLineLength:0]]];
    
    NSURLRequest *req =  [NSURLRequest requestWithURL:url];
    
    NSURLConnection *connection =[[NSURLConnection alloc] initWithRequest:req delegate:self];
    if (!connection){
        NSLog(@"Error while starting connection!");
        [data release];
        
    }
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Perform if the segue is by name @"First to second".
    if ([[segue identifier] isEqualToString:@"Log In Success"])
    {
        // Get reference to the destination view controller
        TaskDetailTabBarController *targetVC = [segue destinationViewController];
        targetVC.eventID = [self eventID];
        targetVC.passphrase = [self passphrase];
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
    
    NSRange range = [jsonString rangeOfString:@"<?xml"];
    
    if(range.location == 0)
    {
        passphrase = @"";
        UIAlertView* alrt = [[UIAlertView alloc]
                             initWithTitle:@"Error!" message:@"Wrong Username/Password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alrt show];
        [alrt release];
    }
    else
    {
        passphrase = jsonString;
        NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"\\\""];
        passphrase = [[passphrase componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];

        [self performSegueWithIdentifier:@"Log In Success" sender:self];
    }
    
    //[self.tableView reloadData];
    [jsonString release];
}




@end
