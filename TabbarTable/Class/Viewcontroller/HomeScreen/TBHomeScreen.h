//
//  TBHomeScreen.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TKDragView.h"
@interface TBHomeScreen : UIViewController
{
    NSMutableArray *arrDragFrame;
}
@property (retain, nonatomic) IBOutletCollection(UIView) NSArray *goodFrame;
@property (retain, nonatomic) IBOutlet UIButton *logOutPress;
- (IBAction)logOutPress:(id)sender;
@end
