//
//  TBLogin.h
//  TabbarTable
//
//  Created by luan on 5/16/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"
#import "UITextField+placeHolder.h"
#import "UIAlertView+error.h"
@interface TBLogin : UIViewController<UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *locationText;
@property (retain, nonatomic) IBOutlet UITextField *userNameText;
@property (retain, nonatomic) IBOutlet UITextField *passwordText;
@property (retain, nonatomic) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
- (IBAction)loginPress:(id)sender;
- (IBAction)signUpPress:(id)sender;
@end
