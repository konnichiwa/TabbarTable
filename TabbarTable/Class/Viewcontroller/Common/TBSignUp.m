//
//  TBSignUp.m
//  TabbarTable
//
//  Created by luan on 5/17/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBSignUp.h"

@interface TBSignUp ()

@end

@implementation TBSignUp

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

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [_signUppress release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSignUppress:nil];
    [super viewDidUnload];
}
- (IBAction)signUpPress:(id)sender {
}

- (IBAction)chooseCountryPress:(id)sender {
}

- (IBAction)chooseBusinessTypePress:(id)sender {
}
@end
