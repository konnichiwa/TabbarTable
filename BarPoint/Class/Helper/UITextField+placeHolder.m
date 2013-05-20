//
//  UITextField+placeHolder.m
//  TabbarTable
//
//  Created by luan on 5/17/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "UITextField+placeHolder.h"

@implementation UITextField (placeHolder)
- (void) drawPlaceholderInRect:(CGRect)rect {
    [[UIColor whiteColor] setFill];
    [[self placeholder] drawInRect:rect withFont:[self font]];
}
@end
