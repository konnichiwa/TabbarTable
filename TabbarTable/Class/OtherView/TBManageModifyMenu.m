//
//  TBManageModifyMenu.m
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBManageModifyMenu.h"

@implementation TBManageModifyMenu
+(TBModifyMenuCell1*)cellType1ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower{
    static NSString *indentifier = @"TBModifyMenuCell1";
    TBModifyMenuCell1 *cell = (TBModifyMenuCell1 *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TBModifyMenuCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell1 class]])
                cell = (TBModifyMenuCell1 *)oneObject;
    }
    return cell;
}
+(TBModifyMenuCell2*)cellType2ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower{
    static NSString *indentifier = @"TBModifyMenuCell2";
    TBModifyMenuCell2 *cell = (TBModifyMenuCell2 *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TBModifyMenuCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell2 class]])
                cell = (TBModifyMenuCell2 *)oneObject;
    }
    return cell;
}
+(TBModifyMenuCell3*)cellType3ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower{
    static NSString *indentifier = @"TBModifyMenuCell3";
    TBModifyMenuCell3 *cell = (TBModifyMenuCell3 *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TBModifyMenuCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell3 class]])
                cell = (TBModifyMenuCell3 *)oneObject;
    }
    return cell;
}
+(TBModifyMenuCell4*)cellType4ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower{
    static NSString *indentifier = @"TBModifyMenuCell4";
    TBModifyMenuCell4 *cell = (TBModifyMenuCell4 *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TBModifyMenuCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell4 class]])
                cell = (TBModifyMenuCell4 *)oneObject;
    }
    return cell;
}
+(TBModifyMenuCell5*)cellType5ForModifyMenuWithTable:(UITableView*)aTableView WithOwer:(UIViewController*)ower{
    static NSString *indentifier = @"TBModifyMenuCell5";
    TBModifyMenuCell5 *cell = (TBModifyMenuCell5 *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TBModifyMenuCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell5 class]])
                cell = (TBModifyMenuCell5 *)oneObject;
    }
    return cell;
}
@end
