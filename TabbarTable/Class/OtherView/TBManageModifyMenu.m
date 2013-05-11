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
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBModifyMenuCell1 class]])
                cell = (TBModifyMenuCell1 *)oneObject;
    }
    return cell;
}
@end
