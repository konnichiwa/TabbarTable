//
//  TBTextFieldHolder.m
//  BarPoint
//
//  Created by luan on 6/19/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBTextFieldHolder.h"

@implementation TBTextFieldHolder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void) drawPlaceholderInRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[self font]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
