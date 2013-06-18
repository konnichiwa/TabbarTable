//
//  TBEmployee.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBScheduleViewController.h"
#import "HPGrowingTextView.h"
#import "TPKeyboardAvoidingScrollView.h"

#define WIDTHPOPUP 377
#define HIGHTPOPUP 423
@interface TBEmployee : UIViewController<UITextFieldDelegate>
{
    UIView *overlayerView;
}
@property (retain, nonatomic) IBOutlet UITableView *messageTable;
@property (retain, nonatomic) IBOutlet UITableView *leftTableView;
@property (retain, nonatomic) IBOutlet UITableView *rightTableView;
@property (retain, nonatomic) IBOutlet UIView *popupImage;
@property (retain, nonatomic) IBOutlet UIView *popupImage1;
@property (retain, nonatomic) IBOutlet HPGrowingTextView *textView;
@property (retain, nonatomic) IBOutlet UIView *messageView;
@property (retain, nonatomic) IBOutlet UIScrollView *scrollviewToAjd;
@property (retain, nonatomic) IBOutlet UIImageView *bgmsgBox;
@property (retain, nonatomic) IBOutlet UIImageView *textEntryMsgbox;
@property (retain, nonatomic) IBOutlet UIImageView *messagePlahoderBox;
@property (retain, nonatomic) IBOutlet HPGrowingTextView *contentMsgBox;
@property (retain, nonatomic) IBOutlet UIView *showMessageView;
@property (retain, nonatomic) IBOutlet UITextField *textMessage;
@property (retain, nonatomic) IBOutlet UIButton *btnSendSMS;
@property (retain, nonatomic) IBOutlet UIImageView *popupImageView;
@property (retain, nonatomic) IBOutlet UILabel *popupTitleText;
@property (retain, nonatomic) IBOutlet UILabel *nameSchedule;

- (IBAction)submitImagePress:(id)sender;

- (IBAction)closePopupBtn:(id)sender;
- (IBAction)schedulePress:(id)sender;
- (IBAction)newMessPress:(id)sender;
- (IBAction)submitPress:(id)sender;
- (IBAction)sendMessagePress:(id)sender;
- (IBAction)senPress:(id)sender;
@end
