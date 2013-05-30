//
//  TBNewCheck.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
#import "ColorPickerViewController.h"
@interface TBNewCheck : UIViewController<UISearchBarDelegate>

@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UIGridView *uitableview1;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *btnCheckOderItems;
@property (retain, nonatomic) IBOutlet UITableView *tableOderList;
- (IBAction)showClientPress:(id)sender;
- (IBAction)paymentPress:(id)sender;
- (IBAction)selectMenuPress:(id)sender;
- (IBAction)selectGroupPress:(id)sender;
- (IBAction)checkOderItemsPress:(id)sender;
@end
