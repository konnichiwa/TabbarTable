//
//  TBLogin.m
//  TabbarTable
//
//  Created by luan on 5/16/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBLogin.h"
#import "TBAppDelegate.h"
#import "TBSignUp.h"
@interface TBLogin ()

@end

@implementation TBLogin

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
    _scrollView.contentSize=CGSizeMake(1024, 768);
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgApp.png"]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}
-(void)textFieldDidEndEditing:(UITextField *)textField{

    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (BOOL)shouldAutorotate {
    return YES;
}

-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}
- (IBAction)loginPress:(id)sender {
    [self presentModalViewController:[TBAppDelegate shareAppDelegate].tabbarView animated:YES];
}

- (IBAction)signUpPress:(id)sender {
    TBSignUp *aTBSignUp=[[TBSignUp alloc] initWithNibName:@"TBSignUp" bundle:nil];
    [self.navigationController pushViewController:aTBSignUp animated:YES];
}
@end
