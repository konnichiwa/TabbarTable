//
//  UIPlaceHolderTextView.h
//  LinkDenity
//
//  Created by cncsoft on 2/28/13.
//  Copyright (c) 2013 cncsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView
{NSString *placeholder;
UIColor *placeholderColor;

@private
UILabel *placeHolderLabel;
}
@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;
@end
