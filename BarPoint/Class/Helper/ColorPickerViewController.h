//
//  ColorPickerViewController.h
//  MathMonsters
//
//  Created by Transferred on 1/12/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorPickerDelegate <NSObject>
@optional

-(void)selectedAtIndex:(int)index withTag:(int)tag;
@end

@interface ColorPickerViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *colorNames;
@property (nonatomic, assign) id<ColorPickerDelegate> delegate;
- (void)showPoppoWitharray:(NSArray*)array inRect:(CGRect)rect inView:(UIView*)view withPopoverArrow:(UIPopoverArrowDirection)popoverArrow withDelegate:(id)dele WithTag:(int)tag;
-(void)dismissPoppo;
@end
