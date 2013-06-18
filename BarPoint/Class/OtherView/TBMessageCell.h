//
//  TBMessageCell.h
//  TabbarTable
//
//  Created by luan on 5/18/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBMessageCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *nameText;
@property (retain, nonatomic) IBOutlet UILabel *msgText;
@property (retain, nonatomic) IBOutlet UILabel *timeText;

@end
