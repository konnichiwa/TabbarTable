//
//  DetailClient.m
//  BarPoint
//
//  Created by luan on 5/21/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "DetailClient.h"

@interface DetailClient ()

@end

@implementation DetailClient

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_backPress release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setBackPress:nil];
    [super viewDidUnload];
}
- (IBAction)backPress:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
