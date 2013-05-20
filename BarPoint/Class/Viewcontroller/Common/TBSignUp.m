//
//  TBSignUp.m
//  TabbarTable
//
//  Created by luan on 5/17/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBSignUp.h"
#import "ColorPickerViewController.h"
#import "TBAppDelegate.h"
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
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgApp.png"]];
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
    [_scrollView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSignUppress:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
- (IBAction)signUpPress:(id)sender {
    [self presentModalViewController:[TBAppDelegate shareAppDelegate].tabbarView animated:YES];
}

- (IBAction)chooseCountryPress:(id)sender {
        [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:3];
}

- (IBAction)chooseBusinessTypePress:(id)sender {
            [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:2];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
