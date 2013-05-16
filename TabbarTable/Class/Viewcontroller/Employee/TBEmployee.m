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
@interface TBEmployee ()
{
    CGPoint backPoint;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgApp.png"]];
    overlayerView=[[UIView alloc] initWithFrame:self.view.frame];
    overlayerView.backgroundColor=[UIColor blackColor];
    [self setupMessBox];
    // Do any additional setup after loading the view from its nib.
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
        return 15;
    }else{
        return 20;
    }
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (aTableView.tag==1) {
        static NSString *indentifier = @"EmployeeCellLeft";
        EmployeeCellLeftCell *cell = (EmployeeCellLeftCell *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
        //cell = nil;
        if (cell == nil)  {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                         owner:self options:nil] ;
            for (id oneObject in nib)
                if ([oneObject isKindOfClass:[EmployeeCellLeftCell class]])
                    cell = (EmployeeCellLeftCell *)oneObject;
        }
        cell.puchBtn1.tag=indexPath.row;
        cell.puchBtn2.tag=indexPath.row;
        [cell.puchBtn1 addTarget:self action:@selector(punch1Press:) forControlEvents:UIControlEventTouchUpInside];
        [cell.puchBtn2 addTarget:self action:@selector(punch2Press:) forControlEvents:UIControlEventTouchUpInside];
        cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellLeftEmployee.png"]];
        //add dot right of animal name
        return cell;
    }else{
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
        //add dot right of animal name
        return cell;

    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
#pragma mark
#pragma selected table
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
#pragma mark- action
- (IBAction)closePopupBtn:(id)sender {
    [self hidePopupTocenterWithView:_popupImage fromPoint:backPoint];
}

- (IBAction)schedulePress:(id)sender {
    TBScheduleViewController *aTBScheduleViewController=[[[TBScheduleViewController alloc] initWithNibName:@"TBScheduleViewController" bundle:nil] autorelease];
    [self.navigationController pushViewController:aTBScheduleViewController animated:YES];
}

- (IBAction)newMessPress:(id)sender {
}
-(void)punch1Press:(id)sender{
    CGPoint frame =   [[sender superview] convertPoint:[sender center] toView:self.view];
    backPoint=frame;
    [self showPopupTocenterWithView:_popupImage fromPoint:frame];
}
-(void)punch2Press:(id)sender{

    CGPoint frame =   [[sender superview] convertPoint:[sender center] toView:self.view];
    backPoint=frame;
    [self showPopupTocenterWithView:_popupImage fromPoint:frame];
}
#pragma mark-show hide punch image
-(void)showPopupTocenterWithView:(UIView*)myView fromPoint:(CGPoint)point{
    myView=_popupImage;
    CGRect frame=CGRectMake(1024/2.0-WIDTHPOPUP/2.0, 768/2.0-HIGHTPOPUP/2.0, WIDTHPOPUP, HIGHTPOPUP);
    myView.frame=CGRectMake(0, 0, 0, 0);
    myView.center=point;
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:overlayerView];
    overlayerView.alpha=0;
    myView.alpha=0;
    overlayerView.frame=CGRectMake(0, 0, 1024, 768);
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:myView];
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
