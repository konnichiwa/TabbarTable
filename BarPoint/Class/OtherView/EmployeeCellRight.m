//
//  EmployeeCellRight.m
//  TabbarTable
//
//  Created by luan on 5/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "EmployeeCellRight.h"

@implementation EmployeeCellRight

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
    [_nameText release];
    [_contentText release];
    [_dateText release];
    [super dealloc];
}
@end
