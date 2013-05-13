//
//  TBNewCheck.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGridView.h"
@interface TBNewCheck : UIViewController

@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UIGridView *uitableview1;
@property (retain, nonatomic) IBOutlet UITableView *tableOderList;
- (IBAction)showClientPress:(id)sender;
@end
