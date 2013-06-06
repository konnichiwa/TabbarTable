//
//  EmployeeCellLeftCell.m
//  TabbarTable
//
//  Created by luan on 5/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "EmployeeCellLeftCell.h"

@implementation EmployeeCellLeftCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_puchBtn1 release];
    [_puchBtn2 release];
    [_dateText release];
    [_timeInText release];
    [_timeOutText release];
    [_timeText release];
    [super dealloc];
}
@end
