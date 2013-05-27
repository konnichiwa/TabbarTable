//
//  TBModifyMenuCell3.m
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBModifyMenuCell3.h"
#import "NSArray+sortBy.h"
@implementation TBModifyMenuCell3

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    self.textlabel=[self.textlabel sortByObjectTag];
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_numText release];
    [_noteText release];
    [_textlabel release];
    [_slider release];
    [super dealloc];
}
@end
