//
//  TBHomeScreen.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBHomeScreen.h"

@interface TBHomeScreen ()

@end

@implementation TBHomeScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrDragFrame=[[NSMutableArray alloc] initWithCapacity:[_goodFrame count]];
    for (UIView *view in _goodFrame) {
        [arrDragFrame addObject:TKCGRectValue(view.frame)];
    }
    for (int i=0; i<12; i++) {
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"homeItem%d",i+1]];
        TKDragView *dragView = [[TKDragView alloc] initWithImage:image
                                                      startFrame:[[_goodFrame objectAtIndex:i] frame]
                                                      goodFrames:arrDragFrame
                                                       badFrames:nil
                                                     andDelegate:(id)self];
        dragView.canDragMultipleDragViewsAtOnce = NO;
        dragView.canUseSameEndFrameManyTimes = NO;
//        dragView.canSwapToStartPosition=NO;
               [self.view addSubview:dragView];
    }
    // Do any additional setup after loading the view from its nib.
}
#pragma mark - TKDragViewDelegate

- (void)dragViewDidStartDragging:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    }];
}

- (void)dragViewDidEndDragging:(TKDragView *)dragView{
    
    [UIView animateWithDuration:0.2 animations:^{
        dragView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_goodFrame release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setGoodFrame:nil];
    [super viewDidUnload];
}
@end
