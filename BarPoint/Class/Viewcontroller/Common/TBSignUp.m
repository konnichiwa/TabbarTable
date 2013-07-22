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
    NSMutableArray *allCountry;
    NSArray *allEmType;
    NSMutableDictionary *dictForUpload;
        NSArray *fields;
    ColorPickerViewController *popopView;
}
@end

@implementation TBSignUp
@synthesize keyboardControls;
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
    popopView=[[ColorPickerViewController alloc] init];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgApp.png"]];
    dictForUpload=[[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"1",@"",@"",@"",@"",@"",@"ipad",@"BarPoint Apple",@"",nil] forKeys:[NSArray arrayWithObjects:@"noinsert",@"loc_name",@"loc_email",@"Country",@"loc_contactname",@"loc_phone",@"created_mobile",@"created_on",@"loc_type",nil]];
    // Do any additional setup after loading the view from its nib.
    fields = [[NSArray alloc] initWithObjects: self.contactNameText, self.businessNameText,self.phoneText, self.emailText,self.countryText,self.businessTypeText,nil];
    [self setKeyboardControls:[[BSKeyboardControls alloc] initWithFields:fields]];
    [self.keyboardControls setDelegate:(id)self];

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
    [_countryBtn release];
    [_bussinessTypebtn release];
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
    [self setCountryBtn:nil];
    [self setBussinessTypebtn:nil];
    [super viewDidUnload];
}
#pragma mark-action
- (IBAction)signUpPress:(id)sender {
    if (![self NSStringIsValidEmail:_emailText.text]) {
        [UIAlertView error:@"Please input a valid email"];
        return;
    };
    if (![self isValidPhoneNum:_phoneText.text]) {
        [UIAlertView error:@"Please input a valid 10 digit phone number"];
        return;
    }
    if ([[_contactNameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_businessNameText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_phoneText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||[[_emailText.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""]||([_contactNameText.text isEqualToString:@"Country"])||([_businessTypeText.text isEqualToString:@"Business Type"])) {
        [UIAlertView error:@"Please input all field"];
        return;
    }

    [dictForUpload setObject:_contactNameText.text forKey:@"loc_contactname"];
    [dictForUpload setObject:_businessNameText.text forKey:@"loc_name"];
    [dictForUpload setObject:[NSNumber numberWithInt:[_phoneText.text integerValue]] forKey:@"loc_phone"];
    [dictForUpload setObject:_emailText.text forKey:@"loc_email"];
    [[API sharedInstance] signUpWithDict:dictForUpload WithCompleteBlock:^(id result,NSError *error){
        if (!error) {
            NSString* newStr = [[[NSString alloc] initWithData:(NSData*)result
                                                      encoding:NSUTF8StringEncoding] autorelease];
            NSString *mess=@"";
            if ([newStr intValue]==1){
                mess=@"A representative will contact you shortly to complete your registration.";
            }else{
                mess=@"This Email Already Exist.";

            }
            [[[[UIAlertView alloc] initWithTitle:@"BarPoint" message:mess delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease] show];
        }else{
            NSLog(@"error:%@",[error description]);
            [UIAlertView error:[error description]];
        }
    }];
    
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)chooseCountryPress:(id)sender {
    allCountry=nil;
    allCountry=[[NSMutableArray alloc] initWithArray:[[Country MR_findAllSortedBy:@"name" ascending:YES] valueForKeyPath:@"name"]];
    [allCountry removeObject:@"United States"];
    [allCountry insertObject:@"United States" atIndex:0];
    
    [popopView showPoppoWitharray:allCountry inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:3];
}

- (IBAction)chooseBusinessTypePress:(id)sender {
    allEmType=nil;
    allEmType=[[NSArray alloc] initWithArray:[[TypeLocation MR_findAllSortedBy:@"name" ascending:YES] valueForKeyPath:@"name"]];
            [popopView showPoppoWitharray:allEmType inRect:[sender frame] inView:self.scrollView withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:2];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    if (tag==3) {
        Country *country=[TBManageDatabase getcountryWithName:[allCountry objectAtIndex:index]];
        if (country) {
            _countryText.text=[allCountry objectAtIndex:index];
            [dictForUpload setObject:country.iD forKey:@"Country"];
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
- (void)keyboardControlsDonePressed:(BSKeyboardControls *)keyboardControls
{
    [keyboardControls.activeField resignFirstResponder];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
        [self.keyboardControls setActiveField:textField];
    if (textField==self.countryText) {
        [popopView dismissPoppo];
        [self performSelector:@selector(chooseCountryPress:) withObject:_countryBtn afterDelay:0.6];
    }
    if (textField==self.businessTypeText) {
        [popopView dismissPoppo];
        [self performSelector:@selector(chooseBusinessTypePress:) withObject:_bussinessTypebtn afterDelay:0.6];
    }

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField==_countryText||textField==_businessTypeText) {
        return NO;
    }
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
-(BOOL)isValidPhoneNum:(NSString*)num{
    NSString *phoneNumber = num;
    if ([phoneNumber length]!=10) {
        return NO;
    }
    if (![self isNumeric:phoneNumber]) {
        return NO;
    }
    return YES;
}
-(BOOL)isNumeric:(NSString*)inputString{
    BOOL isValid = NO;
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:inputString];
    isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
    return isValid;
}
@end
