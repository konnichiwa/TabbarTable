//
//  TBEmployee.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBScheduleViewController.h"
#define WIDTHPOPUP 377
#define HIGHTPOPUP 423
@interface TBEmployee : UIViewController
{
    UIView *overlayerView;
}
@property (retain, nonatomic) IBOutlet UITableView *leftTableView;
@property (retain, nonatomic) IBOutlet UITableView *rightTableView;
@property (retain, nonatomic) IBOutlet UIView *popupImage;
- (IBAction)closePopupBtn:(id)sender;
- (IBAction)schedulePress:(id)sender;
- (IBAction)newMessPress:(id)sender;
@end
