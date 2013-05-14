//
//  Payment.h
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
#import "ColorPickerViewController.h"
@interface Payment : UIViewController

@property (retain, nonatomic) IBOutlet UITableView *tableOderList;
@property (retain, nonatomic) IBOutlet UIGridView *uitableview1;
@property (retain, nonatomic) IBOutlet UIView *cashView;
@property (retain, nonatomic) IBOutlet UIView *expenseTABView;
@property (retain, nonatomic) IBOutlet UIView *surchargeView;
@property (retain, nonatomic) IBOutlet UIView *debitCardView;
@property (retain, nonatomic) IBOutlet UIView *adjustmentView;
@property (retain, nonatomic) IBOutlet UIView *creditCardView;

- (IBAction)typePayment:(id)sender;

@end
