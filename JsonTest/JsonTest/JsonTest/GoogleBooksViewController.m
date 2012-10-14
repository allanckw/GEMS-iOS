//
//  GoogleBooksViewController.m
//  JsonTest
//
//  Created by Wee Kwan Tan on 18/9/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GoogleBooksViewController.h"

@interface GoogleBooksViewController ()

@end

@implementation GoogleBooksViewController

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

-(void) query{
   
    GoogleBookService *gbs = [[GoogleBookService alloc] init];
    NSString *txinput = self.input.text;
    // NSLog(txinput);
    [gbs PerformSearch:txinput];
    self.input.text = txinput;
  //  self.output.text = [[gbs PerformSearch:txinput]];
    //Book* book = [[Book alloc] initWithJSONDictionary:item];
    
}


@end
