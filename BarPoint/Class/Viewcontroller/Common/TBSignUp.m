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
#import "Country.h"
#import "TypeLocation.h"
#import "UIAlertView+error.h"
#import "API.h"
@interface TBSignUp ()
{
    NSArray *allCountry;
    NSArray *allEmType;
    NSMutableDictionary *dictForUpload;
}
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
    dictForUpload=[[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:[NSNumber numberWithInt:1],@"",@"",@"",@"",@"",@"ipad",@"WinePAD",@"",nil] forKeys:[NSArray arrayWithObjects:@"noinsert",@"loc_name",@"loc_email",@"Country",@"loc_contactname",@"loc_phone",@"created_mobile",@"created_on",@"loc_type",nil]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    [_signUppress release];
    [_scrollView release];
    [_countryText release];
    [_businessTypeText release];
    [_contactNameText release];
    [_businessNameText release];
    [_phoneText release];
    [_emailText release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSignUppress:nil];
    [self setScrollView:nil];
    [self setCountryText:nil];
    [self setBusinessTypeText:nil];
    [self setContactNameText:nil];
    [self setBusinessNameText:nil];
    [self setPhoneText:nil];
    [self setEmailText:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)signUpPress:(id)sender {
    if ([[_contactNameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_businessNameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_phoneText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_emailText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||([_contactNameText.text isEqualToString:@"Country"])||([_businessTypeText.text isEqualToString:@"Business Type"])) {
        [UIAlertView error:@"Please input all field"];
        return;
    }
    if (![self NSStringIsValidEmail:_emailText.text]) {
        [UIAlertView error:@"Input invalid email"];
        return;
    }
    ;
    [dictForUpload setObject:_contactNameText.text forKey:@"loc_contactname"];
    [dictForUpload setObject:_businessNameText.text forKey:@"loc_name"];
    [dictForUpload setObject:[NSNumber numberWithInt:[_phoneText.text integerValue]] forKey:@"loc_phone"];
    [dictForUpload setObject:_emailText.text forKey:@"loc_email"];
    [[API sharedInstance] signUpWithDict:dictForUpload WithCompleteBlock:^(id result,NSError *error){
        if (!error) {
            NSString* newStr = [[[NSString alloc] initWithData:(NSData*)result
                                                      encoding:NSUTF8StringEncoding] autorelease];
            if ([newStr intValue]==1) {
                [self presentModalViewController:[TBAppDelegate shareAppDelegate].tabbarView animated:YES];
            }else{
                [UIAlertView error:@"This Email Already Exist"];
            }
        }else{
            NSLog(@"error:%@",[error description]);
            [UIAlertView error:[error description]];
        }
    }];
    
    
    
}

- (IBAction)chooseCountryPress:(id)sender {
    allCountry=nil;
    allCountry=[[NSArray alloc] initWithArray:[[Country MR_findAll] valueForKeyPath:@"name"]];
        [[ColorPickerViewController alloc] showPoppoWitharray:allCountry inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:3];
}

- (IBAction)chooseBusinessTypePress:(id)sender {
    allEmType=nil;
    allEmType=[[NSArray alloc] initWithArray:[[TypeLocation MR_findAll] valueForKeyPath:@"name"]];
            [[ColorPickerViewController alloc] showPoppoWitharray:allEmType inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:2];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    if (tag==3) {
        Country *country=[TBManageDatabase getcountryWithName:[allCountry objectAtIndex:index]];
        if (country) {
            _countryText.text=[allCountry objectAtIndex:index];
            [dictForUpload setObject:[NSNumber numberWithInt:[country.iD intValue]] forKey:@"Country"];
        }
        allCountry=nil;
    }
    if (tag==2) {
        TypeLocation *country=[TBManageDatabase gettypeLocationWithName:[allEmType objectAtIndex:index]];
        if (country) {
            _businessTypeText.text=[allEmType objectAtIndex:index];
            [dictForUpload setObject:[NSNumber numberWithInt:[country.iD intValue]] forKey:@"loc_type"];
        }
        allEmType=nil;
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
@end
