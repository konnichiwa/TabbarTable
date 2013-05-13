//
//  TBModifyMenu.h
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBModifyMenu : UIViewController
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)cancelPress:(id)sender;
- (IBAction)donePress:(id)sender;
@end
