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
    overlayerView=[[UIView alloc] initWithFrame:self.view.frame];
    overlayerView.backgroundColor=[UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLeftTableView:nil];
    [self setRightTableView:nil];
    [self setPopupImage:nil];
    [super viewDidUnload];
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
    myView.frame=CGRectMake(point.x, point.y, 0, 0);
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:overlayerView];
    overlayerView.alpha=0;
    overlayerView.frame=CGRectMake(0, 0, 1024, 768);
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:myView];
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         myView.frame=frame;
                         overlayerView.alpha=0.7;
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
                     }
                     completion:^(BOOL finished){
                         [myView removeFromSuperview];
                         [overlayerView removeFromSuperview];
                     }];
    
}
@end
