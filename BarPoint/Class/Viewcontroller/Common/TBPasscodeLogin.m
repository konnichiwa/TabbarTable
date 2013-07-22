//
//  TBPasscodeLogin.m
//  BarPoint
//
//  Created by luan on 6/20/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBPasscodeLogin.h"
#import "TBAppDelegate.h"
#import "TBManageDatabase.h"
@interface TBPasscodeLogin ()
{
    UIView *tempView;
}
@end

@implementation TBPasscodeLogin

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
    tempView=[[UIView alloc] initWithFrame:CGRectZero];
    _resultText.inputView=tempView;
    [_resultText becomeFirstResponder];
    [_resultText endEditing:NO];
    // Do any additional setup after loading the view from its nib.
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

-(void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardDidHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
     }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)onKeyboardHide:(NSNotification*)n{
    _resultText.inputView=tempView;
    [_resultText reloadInputViews];
    [_resultText becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self enterPress:nil];
    return YES;
}
- (void)dealloc {
    [_resultText release];
    [_keyboardView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setResultText:nil];
    [self setKeyboardView:nil];
    [super viewDidUnload];
}
- (IBAction)numPress:(id)sender {
    if ([sender tag]==11) {
        [_resultText deleteBackward];
        return;
    }
    if ([sender tag]==12) {
        _resultText.InputView = nil;
        [_resultText reloadInputViews];
        return;
    }
    [_resultText insertText:[NSString stringWithFormat:@"%d", [sender tag]]];
}

- (IBAction)logOutPress:(id)sender {
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Manager Log Out" message:@"Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert.alertViewStyle=UIAlertViewStyleSecureTextInput;
    [alert show];
    [alert release];
   
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        UITextField *code = [alertView textFieldAtIndex:0];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (IBAction)enterPress:(id)sender {

    
    [self presentModalViewController:[TBAppDelegate shareAppDelegate].tabbarView animated:YES];
    self.resultText.text=@"";
}
@end
