//
//  TBSignUp.h
//  TabbarTable
//
//  Created by luan on 5/17/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBSignUp : UIViewController
- (IBAction)backPress:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *signUppress;
- (IBAction)signUpPress:(id)sender;
- (IBAction)chooseCountryPress:(id)sender;
- (IBAction)chooseBusinessTypePress:(id)sender;

@end
