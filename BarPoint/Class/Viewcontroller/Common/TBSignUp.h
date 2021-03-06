//
//  TBSignUp.h
//  TabbarTable
//
//  Created by luan on 5/17/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"
#import "BSKeyboardControls.h"
@interface TBSignUp : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UITextField *contactNameText;
@property (retain, nonatomic) IBOutlet UITextField *businessNameText;
@property (retain, nonatomic) IBOutlet UITextField *phoneText;
@property (retain, nonatomic) IBOutlet UITextField *emailText;
@property (retain, nonatomic) IBOutlet UITextField *countryText;
@property (retain, nonatomic) IBOutlet UITextField *businessTypeText;
@property (retain, nonatomic) IBOutlet UIButton *countryBtn;
@property (retain, nonatomic) IBOutlet UIButton *bussinessTypebtn;
@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
- (IBAction)backPress:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *signUppress;
- (IBAction)signUpPress:(id)sender;
- (IBAction)chooseCountryPress:(id)sender;
- (IBAction)chooseBusinessTypePress:(id)sender;

@end
