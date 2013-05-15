//
//  TBManageModifyMenu.h
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBModifyMenuCell1.h"
#import "TBModifyMenuCell2.h"
#import "TBModifyMenuCell3.h"
#import "TBModifyMenuCell4.h"
#import "TBModifyMenuCell5.h"
@interface TBManageModifyMenu : NSObject
+(TBModifyMenuCell1*)cellType1ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower;
+(TBModifyMenuCell2*)cellType2ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower;
+(TBModifyMenuCell3*)cellType3ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower;
+(TBModifyMenuCell4*)cellType4ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower;
+(TBModifyMenuCell5*)cellType5ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower;
@end
