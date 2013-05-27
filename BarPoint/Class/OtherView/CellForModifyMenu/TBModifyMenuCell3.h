//
//  TBModifyMenuCell3.h
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBModifyMenuCell3 : UITableViewCell
@property (retain, nonatomic) IBOutlet UITextField *numText;
@property (retain, nonatomic) IBOutlet UITextField *noteText;

@property (retain, nonatomic) IBOutletCollection(UILabel) NSArray *textlabel;
@property (retain, nonatomic) IBOutlet UISlider *slider;
@end
