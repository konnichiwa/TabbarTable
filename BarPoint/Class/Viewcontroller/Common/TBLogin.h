//
//  TBLogin.h
//  TabbarTable
//
//  Created by luan on 5/16/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTextFieldHolder.h"
#import "TPKeyboardAvoidingScrollView.h"
#import "BSKeyboardControls.h"
#import "UIAlertView+error.h"
@interface TBLogin : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *locationText;
@property (retain, nonatomic) IBOutlet UITextField *userNameText;
@property (retain, nonatomic) IBOutlet UITextField *passwordText;
@property (retain, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
@property (nonatomic, strong) BSKeyboardControls *keyboardControls;
- (IBAction)loginPress:(id)sender;
- (IBAction)signUpPress:(id)sender;
- (IBAction)debugPress:(id)sender;
@end
