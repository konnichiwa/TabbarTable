//
//  TBEmployee.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBEmployee.h"
#import "EmployeeCellLeftCell.h"
#import "EmployeeCellRight.h"
#import "TBAppDelegate.h"
#import "TBMessageCell.h"
#import "UserAccount.h"
#import "API.h"
#import "TBManageDatabase.h"
#import "EmployeeSchedule.h"
#import "Message.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface TBEmployee ()
{
    CGPoint backPoint;
    BOOL isNew;
    int countOf;
    BOOL isShowPlaceHoderMessBox;
    NSMutableArray *listSche;
    NSMutableArray *listMsg;
    NSString *imageLinktoSHow;
    NSString *popuptitlestr;

}
@end

@implementation TBEmployee

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}
- (BOOL)shouldAutorotate {
    
    
    return YES;
}

-(NSInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    imageLinktoSHow=@"";
    popuptitlestr=@"";

    listSche=[[NSMutableArray alloc] initWithArray:[EmployeeSchedule MR_findAll]];
    listMsg=[[NSMutableArray alloc] initWithArray:[Message MR_findAll]];
    isShowPlaceHoderMessBox=YES;
    [self checkPlaceholderMess];
    countOf=0;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgApp.png"]];
    overlayerView=[[UIView alloc] initWithFrame:self.view.frame];
    overlayerView.backgroundColor=[UIColor blackColor];
    isNew=YES;
//    _scrollviewToAjd.contentSize=CGSizeMake(1023, 900);
//    _scrollviewToAjd.frame=CGRectMake(0, 1, 1024, 748);
//    _scrollviewToAjd.scrollsToTop=YES;
    // Do any additional setup after loading the view from its nib.
    [(TPKeyboardAvoidingScrollView*)self.view setContentSize:CGSizeMake(0, 0)];
    //get schedule
    UserAccount *user=[TBManageDatabase getAccount];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:user.locationId,user.userName,user.password, nil] forKeys:[NSArray arrayWithObjects:@"location_id",@"emp_id",@"password", nil]];
    _nameSchedule.text=user.userName;
    [[API sharedInstance] getScheduleOfuserWithDict:dict WithCompleteBlock:^(id result,NSError *error){
        if (!error) {
            [TBManageDatabase addScheduleTotable:[(NSArray*)result objectAtIndex:1]];
            listSche=[[NSMutableArray alloc] initWithArray:[EmployeeSchedule MR_findAll]];
            [_leftTableView reloadData];
        }
    }];
    NSMutableDictionary *dict1=[[NSMutableDictionary alloc] initWithObjects:[NSArray arrayWithObjects:user.locationId,user.userName, nil] forKeys:[NSArray arrayWithObjects:@"location_id",@"emp_id", nil]];
    [[API sharedInstance] getMsgOfuserWithDict:dict1 WithCompleteBlock:^(id result,NSError *error){
        if (!error) {
            NSLog(@"mess;%@",[(NSArray*)result objectAtIndex:0]);
            [TBManageDatabase addMsgTotable:[(NSArray*)result objectAtIndex:0]];
            listMsg=[[NSMutableArray alloc] initWithArray:[Message MR_findAll]];
            [_rightTableView reloadData];
        }
    }];
    [dict release];
}
-(void)checkPlaceholderMess{
    if (isShowPlaceHoderMessBox) {
        _messagePlahoderBox.hidden=NO;
        _showMessageView.hidden=YES;
    }else{
        _messagePlahoderBox.hidden=YES;
        _showMessageView.hidden=NO;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - setup messagebox
-(void)setupMessBox{
    _textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
	_textView.minNumberOfLines = 1;
	_textView.maxNumberOfLines = 5;
	_textView.returnKeyType = UIReturnKeyGo; //just as an example
	_textView.font = [UIFont systemFontOfSize:15.0f];
	_textView.delegate = (id)self;
    _textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    _textView.internalTextView.backgroundColor=[UIColor clearColor];
    _textView.backgroundColor = [UIColor clearColor];
    
    UIImage *rawEntryBackground = [UIImage imageNamed:@"MessageEntryBackground.png"];
    UIImage *entryBackground = [rawEntryBackground stretchableImageWithLeftCapWidth:20 topCapHeight:13];
    _bgmsgBox.image=entryBackground;
    _bgmsgBox.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//
    UIImage *rawBackground = [UIImage imageNamed:@"MessageEntryInputField.png"];
    UIImage *background = [rawBackground stretchableImageWithLeftCapWidth:10 topCapHeight:18];
     _textEntryMsgbox.image=background;
    _textEntryMsgbox.autoresizingMask = UIViewAutoresizingFlexibleHeight;

    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
}
#pragma mark
#pragma table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag==1) {
        return [listSche count];
    }else if(tableView.tag==2){
        return [listMsg count];
    }else{
        return countOf;
    }
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (aTableView.tag==1) {
        static NSString *indentifier = @"EmployeeCellLeft";
        EmployeeCellLeftCell *cell = (EmployeeCellLeftCell *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
        EmployeeSchedule *a=[listSche objectAtIndex:indexPath.row];
        //cell = nil;
        if (cell == nil)  {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                         owner:self options:nil] ;
            for (id oneObject in nib)
                if ([oneObject isKindOfClass:[EmployeeCellLeftCell class]])
                    cell = (EmployeeCellLeftCell *)oneObject;
        }
        cell.dateText.text=a.dateSchedule;
        cell.timeInText.text=a.inTime;
        cell.timeOutText.text=a.outTime;
        cell.timeText.text=a.duration;
        cell.puchBtn1.tag=indexPath.row;
        cell.puchBtn2.tag=indexPath.row;
        [cell.puchBtn1 addTarget:self action:@selector(punch1Press:) forControlEvents:UIControlEventTouchUpInside];
        cell.puchBtn1.tag=indexPath.row;
        [cell.puchBtn2 addTarget:self action:@selector(punch2Press:) forControlEvents:UIControlEventTouchUpInside];
        cell.puchBtn2.tag=indexPath.row;
        cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellLeftEmployee.png"]];
        //add dot right of animal name
        return cell;
    }else if(aTableView.tag==2){
        static NSString *indentifier = @"EmployeeCellRight";
        EmployeeCellRight *cell = (EmployeeCellRight *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
        //cell = nil;
        if (cell == nil)  {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                         owner:self options:nil] ;
            for (id oneObject in nib)
                if ([oneObject isKindOfClass:[EmployeeCellRight class]])
                    cell = (EmployeeCellRight *)oneObject;
        }
                cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellRightEmployee.png"]];
        cell.backgroundView.contentMode=UIViewContentModeScaleAspectFit;
        Message *newMess=[listMsg objectAtIndex:indexPath.row];
        if ([newMess.readd isEqualToString:@"1"]) {
            cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellRightEmployeeNew.png"]];
            cell.nameText.textColor=[UIColor whiteColor];
             cell.contentText.textColor=[UIColor whiteColor];
             cell.dateText.textColor=[UIColor whiteColor];
        }else{
           cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellRightEmployee.png"]];
            cell.nameText.textColor=[UIColor darkGrayColor];
            cell.contentText.textColor=[UIColor darkGrayColor];
            cell.dateText.textColor=[UIColor darkGrayColor];
        }
        //add dot right of animal name
        cell.nameText.text=newMess.entered_by_emp_id;
        cell.contentText.text=newMess.message;
        cell.dateText.text=[NSString stringWithFormat:@"%@  %@",newMess.dateMsg,newMess.timeMsg];
        return cell;

    }else{
        static NSString *indentifier = @"TBMessageCell";
        TBMessageCell *cell = (TBMessageCell *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
        //cell = nil;
        if (cell == nil)  {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                         owner:self options:nil] ;
            for (id oneObject in nib)
                if ([oneObject isKindOfClass:[TBMessageCell class]])
                    cell = (TBMessageCell *)oneObject;
        }
        
        return cell;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag==3) {
        return 149;
    }
    return 49;
}
#pragma mark
#pragma selected table
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (tableView.tag==2) {
        
        if (indexPath.row==0) {
            isNew=NO;
           
        }
        countOf=1;
        isShowPlaceHoderMessBox=NO; [self checkPlaceholderMess];
        [_messageTable performSelector:@selector(reloadData) withObject:nil afterDelay:0.5];
    }

}


- (void)dealloc {
    [_leftTableView release];
    [_rightTableView release];
    [_popupImage release];
    [_textView release];
    [_messageView release];
    [_scrollviewToAjd release];
    [_bgmsgBox release];
    [_contentMsgBox release];
    [_textEntryMsgbox release];
    [_popupImage1 release];
    [_showMessageView release];
    [_textMessage release];
    [_messagePlahoderBox release];
    [_messageTable release];
    [_btnSendSMS release];
    [_popupImageView release];
    [_popupTitleText release];
    [_nameSchedule release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLeftTableView:nil];
    [self setRightTableView:nil];
    [self setPopupImage:nil];
    [self setTextView:nil];
    [self setMessageView:nil];
    [self setScrollviewToAjd:nil];
    [self setBgmsgBox:nil];
    [self setContentMsgBox:nil];
    [self setTextEntryMsgbox:nil];
    [self setPopupImage1:nil];
    [self setShowMessageView:nil];
    [self setTextMessage:nil];
    [self setMessagePlahoderBox:nil];
    [self setMessageTable:nil];
    [self setBtnSendSMS:nil];
    [self setPopupImageView:nil];
    [self setPopupTitleText:nil];
    [self setNameSchedule:nil];
    [super viewDidUnload];
}
- (void)growingTextViewDidBeginEditing:(HPGrowingTextView *)growingTextView{
}
- (void)growingTextViewDidEndEditing:(HPGrowingTextView *)growingTextView{
    
    
}
- (void)growingTextView:(HPGrowingTextView *)growingTextView willChangeHeight:(float)height
{
    float diff = (growingTextView.frame.size.height - height);
	CGRect r = _messageView.frame;
    r.size.height -= diff;
    r.origin.y += diff;
	_messageView.frame = r;
}
#pragma mark-textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *text=@"";
    if ([string length]==0) {
        text=[textField.text substringToIndex:[textField.text length]-1];
    }else{
        text=[textField.text stringByAppendingString:string];
    }
    if ([text isEqualToString:@""]) {
        [_btnSendSMS setImage:[UIImage imageNamed:@"btnSendsms_h"] forState:UIControlStateNormal];
    }else{
         [_btnSendSMS setImage:[UIImage imageNamed:@"btnSendsms"] forState:UIControlStateNormal];
    }
    return YES;
}
#pragma mark- action
- (IBAction)submitImagePress:(id)sender {
    [self hidePopupTocenterWithView:_popupImage fromPoint:backPoint];
    [self hidePopupTocenterWithView:_popupImage1 fromPoint:backPoint];
}

- (IBAction)closePopupBtn:(id)sender {
    [self hidePopupTocenterWithView:_popupImage fromPoint:backPoint];
        [self hidePopupTocenterWithView:_popupImage1 fromPoint:backPoint];
}

- (IBAction)schedulePress:(id)sender {
    TBScheduleViewController *aTBScheduleViewController=[[[TBScheduleViewController alloc] initWithNibName:@"TBScheduleViewController" bundle:nil] autorelease];
    aTBScheduleViewController.view.frame=self.view.frame;
    [self.navigationController pushViewController:aTBScheduleViewController animated:YES];
}

- (IBAction)newMessPress:(id)sender {
    countOf=0;
    [_messageTable reloadData];
    [_textMessage becomeFirstResponder];
    isShowPlaceHoderMessBox=NO;
    [self checkPlaceholderMess];

}

- (IBAction)submitPress:(id)sender {
    CGPoint frame =   [[sender superview] convertPoint:[sender center] toView:self.view];
    backPoint=frame;
    [self showPopupTocenterWithView:_popupImage1 fromPoint:frame];
}

- (IBAction)sendMessagePress:(id)sender {

}

- (IBAction)senPress:(id)sender {
    _textMessage.text=@"";
    [_btnSendSMS setImage:[UIImage imageNamed:@"btnSendsms_h"] forState:UIControlStateNormal];
        [_textMessage resignFirstResponder];
}
-(void)punch1Press:(id)sender{
    CGPoint frame =   [[sender superview] convertPoint:[sender center] toView:self.view];
    backPoint=frame;
    EmployeeSchedule *a=[listSche objectAtIndex:[sender tag]];
    imageLinktoSHow=a.imageIn;
    popuptitlestr=[NSString stringWithFormat:@"%@ - %@ - Punch In",a.dateSchedule,a.inTime];
    [self showPopupTocenterWithView:_popupImage fromPoint:frame];
}
-(void)punch2Press:(id)sender{

    CGPoint frame =   [[sender superview] convertPoint:[sender center] toView:self.view];
    EmployeeSchedule *a=[listSche objectAtIndex:[sender tag]];
    imageLinktoSHow=a.imageOut;
        popuptitlestr=[NSString stringWithFormat:@"%@ - %@ - Punch In",a.dateSchedule,a.outTime];
    backPoint=frame;
    [self showPopupTocenterWithView:_popupImage fromPoint:frame];
}
#pragma mark-show hide punch image
-(void)showPopupTocenterWithView:(UIView*)myView fromPoint:(CGPoint)point{
    CGRect frame=CGRectMake(1024/2.0-WIDTHPOPUP/2.0, 768/2.0-HIGHTPOPUP/2.0, WIDTHPOPUP, HIGHTPOPUP);
    myView.frame=CGRectMake(0, 0, 0, 0);
    myView.center=point;
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:overlayerView];
    overlayerView.alpha=0;
    myView.alpha=0;
    overlayerView.frame=CGRectMake(0, 0, 1024, 768);
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:myView];
    NSLog(@"image link:%@",imageLinktoSHow);
    [_popupImageView setImageWithURL:[NSURL URLWithString:imageLinktoSHow] placeholderImage:nil options:SDWebImageProgressiveDownload];
    _popupTitleText.text=popuptitlestr;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         myView.frame=frame;
                         overlayerView.alpha=0.7;
                         myView.alpha=1;
                     }
                     completion:^(BOOL finished){
                         
                     }];

}
-(void)hidePopupTocenterWithView:(UIView*)myView fromPoint:(CGPoint)point{
    CGRect frame=CGRectZero;
    frame.origin=point;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         myView.frame=frame;
                         overlayerView.alpha=0;
                         myView.alpha=0;
                     }
                     completion:^(BOOL finished){
                         [myView removeFromSuperview];
                         [overlayerView removeFromSuperview];
                     }];
    
}
@end
