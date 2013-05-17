//
//  ShowClientScreen.h
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingTableView.h"
@interface ShowClientScreen : UIViewController
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet TPKeyboardAvoidingTableView *tableView;
- (IBAction)submitPress:(id)sender;
@end
