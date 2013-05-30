//
//  TBMenuItem.h
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
@interface TBMenuItem : UIViewController
{
    UIView *overLayerView;

}
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UITableView *tableListItem1;
@property (retain, nonatomic) IBOutlet UITableView *tableListItem2;
@property (retain, nonatomic) IBOutletCollection(UIButton) NSArray *btnCheckOderItems;
@property (retain, nonatomic) IBOutlet UIGridView *gridListItem;
@property (retain, nonatomic) IBOutlet UIView *seatView;
- (IBAction)backPress:(id)sender;
- (IBAction)paymentPress:(id)sender;
- (IBAction)showClientPress:(id)sender;
- (IBAction)modifyPress:(id)sender;
- (IBAction)closeSeatPress:(id)sender;
- (IBAction)applySeatPress:(id)sender;
- (IBAction)seatPress:(id)sender;
- (IBAction)checkOderItemsPress:(id)sender;
@end
