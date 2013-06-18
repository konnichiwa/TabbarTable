//
//  TBScheduleViewController.h
//  TabbarTable
//
//  Created by luan on 5/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBScheduleViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UILabel *headerText;
- (IBAction)btnBackEmployee:(id)sender;
- (IBAction)backBtn:(id)sender;
- (IBAction)infoPress:(id)sender;
@end
