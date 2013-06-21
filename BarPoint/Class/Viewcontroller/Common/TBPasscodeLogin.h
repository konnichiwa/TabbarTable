//
//  TBPasscodeLogin.h
//  BarPoint
//
//  Created by luan on 6/20/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBPasscodeLogin : UIViewController<UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *resultText;
@property (retain, nonatomic) IBOutlet UIView *keyboardView;
- (IBAction)numPress:(id)sender;
- (IBAction)logOutPress:(id)sender;
- (IBAction)enterPress:(id)sender;
@end
