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
- (IBAction)typePayment:(id)sender;

@end