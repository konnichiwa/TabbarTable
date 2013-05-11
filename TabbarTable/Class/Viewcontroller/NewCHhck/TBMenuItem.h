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

@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UITableView *tableListItem1;
@property (retain, nonatomic) IBOutlet UITableView *tableListItem2;
@property (retain, nonatomic) IBOutlet UIGridView *gridListItem;
- (IBAction)backPress:(id)sender;
@end
