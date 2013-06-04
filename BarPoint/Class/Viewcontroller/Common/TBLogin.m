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
#import "API.h"
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
    [_locationText release];
    [_userNameText release];
    [_passwordText release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setScrollView:nil];
    [self setLocationText:nil];
    [self setUserNameText:nil];
    [self setPasswordText:nil];
    [super viewDidUnload];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}
-(void)textFieldDidEndEditing:(UITextField *)textField{

    
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
    

    NSDictionary *dict=[[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:_locationText.text,_userNameText.text,_passwordText.text,@"access_pos_admin", nil] forKeys:[NSArray arrayWithObjects:@"location_id",@"employee_id",@"password",@"type_access ",nil]];
    [[API sharedInstance] loginWithDict:dict WithCompleteBlock:^(id result,NSError *error){
        if (!error) {
            NSLog(@"result:%@",[(NSArray*)result objectAtIndex:0]);
            if ([[(NSArray*)result objectAtIndex:0] integerValue]==1) {
                [self presentModalViewController:[TBAppDelegate shareAppDelegate].tabbarView animated:YES];
            }
            if ([[(NSArray*)result objectAtIndex:0] integerValue]==2) {
                [UIAlertView error:@"login incorrect"];
            }
            if ([[(NSArray*)result objectAtIndex:0] integerValue]==3) {
                [UIAlertView error:@": A SoftPoint Representative will contact you shortly to complete your registration."];
            }
            
        }else{
            [UIAlertView error:[error description]];
        }
    }];
}

- (IBAction)signUpPress:(id)sender {

    TBSignUp *aTBSignUp=[[TBSignUp alloc] initWithNibName:@"TBSignUp" bundle:nil];
    [self.navigationController pushViewController:aTBSignUp animated:YES];
}

@end
