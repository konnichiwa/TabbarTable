//
//  DetailClient.h
//  BarPoint
//
//  Created by luan on 5/21/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBAddClientCell.h"
@interface DetailClient : UIViewController

@property (retain, nonatomic) IBOutlet UITableView *tableView1;
@property (retain, nonatomic) IBOutlet UITableView *tableView2;
@property (retain, nonatomic) IBOutlet UIButton *backPress;
- (IBAction)backPress:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *NameViewSection;
@property (retain, nonatomic) IBOutlet UIView *infomationViewSection;
@property (retain, nonatomic) IBOutlet UIView *addPhoneViewSection;
@property (retain, nonatomic) IBOutlet UIView *newEmailViewSection;
@property (retain, nonatomic) IBOutlet UIView *addAddressView;
@end
