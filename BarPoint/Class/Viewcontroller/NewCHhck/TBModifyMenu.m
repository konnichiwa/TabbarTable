//
//  TBModifyMenu.m
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBModifyMenu.h"
#import "TBAppDelegate.h"
#import "TBManageModifyMenu.h"
#import "TBModifyMenuCell1.h"
#import "TBModifyMenuCell2.h"
#import "TBModifyMenuCell3.h"
#import "TBModifyMenuCell4.h"
#import "TBModifyMenuCell5.h"
#import "ColorPickerViewController.h"
@interface TBModifyMenu ()
{
    
    NSMutableArray *titleHeader;
}
@end

@implementation TBModifyMenu

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"fame:%@",NSStringFromCGRect(self.view.frame));
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
    _searchBar.backgroundColor=[UIColor clearColor];
    [[_searchBar.subviews objectAtIndex:0] removeFromSuperview];
    titleHeader=[[NSMutableArray alloc] initWithObjects:@"Side",@"Preparation",@"Temperature",@"Extra",@"Note",nil];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark - table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 9;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 2;
            break;
        case 4:
            return 3;
            break;
            
        default:
            break;
    }
    return 9;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {        TBModifyMenuCell1 *cell=[TBManageModifyMenu cellType1ForModifyMenuWithTable:aTableView WithOwer:self];
            cell.numText.delegate=(id)self;
            return cell;
        }
            break;
        case 1:
        {        TBModifyMenuCell2 *cell=[TBManageModifyMenu cellType2ForModifyMenuWithTable:aTableView WithOwer:self];
            if (indexPath.row==0) {
                for (UIButton *btn in cell.btnSelection) {
                    if (btn.tag==5) {
                        [btn setSelected:YES];
                    }
                    [btn addTarget:self action:@selector(pressChooseModify1:) forControlEvents:UIControlEventTouchUpInside];
                    [btn setBackgroundImage:[UIImage imageNamed:@"cellBtnBlue.png"] forState:UIControlStateSelected];
                }
            }
            if (indexPath.row==1) {
                for (UIButton *btn in cell.btnSelection) {
                    if (btn.tag==1) {
                        [btn setSelected:YES];
                    }
                    [btn addTarget:self action:@selector(pressChooseModify2:) forControlEvents:UIControlEventTouchUpInside];
                    [btn setBackgroundImage:[UIImage imageNamed:@"celBtnRed.png"] forState:UIControlStateSelected];
                }
            }
            
            return cell;
        }
            break;
        case 2:
        {        TBModifyMenuCell3 *cell=[TBManageModifyMenu cellType3ForModifyMenuWithTable:aTableView WithOwer:self];
            [cell.slider addTarget:self action:@selector(chagevalue:) forControlEvents:UIControlEventValueChanged];
            return cell;
        }
            break;
        case 3:
        {        TBModifyMenuCell1 *cell=[TBManageModifyMenu cellType1ForModifyMenuWithTable:aTableView WithOwer:self];
            cell.numText.delegate=(id)self;
            return cell;
        }
            break;
        case 4:
        {
            if (indexPath.row==2) {
                TBModifyMenuCell5 *cell=[TBManageModifyMenu cellType5ForModifyMenuWithTable:aTableView WithOwer:self];
                cell.noteText.delegate=(id)self;
                return cell;
            }else{
                TBModifyMenuCell4 *cell=[TBManageModifyMenu cellType4ForModifyMenuWithTable:aTableView WithOwer:self];
                [cell.btnChooseCelebration addTarget:(id)self action:@selector(ChooseCelebrationPress:) forControlEvents:UIControlEventTouchUpInside];
                return cell;
            }
        }
            break;
        default:
            break;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc] init];
    headerView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgheaderTableModify.png"]];
    UILabel *textTitle=[[UILabel alloc] init];
    textTitle.frame=CGRectMake(0, 0, 640, 47);
    textTitle.textAlignment=NSTextAlignmentCenter;
    textTitle.text=[titleHeader objectAtIndex:section];
    textTitle.textColor=[UIColor whiteColor];
    textTitle.font=[UIFont boldSystemFontOfSize:15];
    textTitle.backgroundColor=[UIColor clearColor];
    [headerView addSubview:textTitle];
    [textTitle release];
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section==4)&&(indexPath.row==2)) {
        return 97;
    }
    return 48;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 47;
}
#pragma mark-table action
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}
-(void)chagevalue:(id)sender{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0   inSection:2];
    TBModifyMenuCell3 *cell=(TBModifyMenuCell3*)[_tableView cellForRowAtIndexPath:indexPath];
    float range=[(UISlider*)sender value];
    for (UILabel *label in cell.textlabel ) {
        label.textColor=[UIColor darkGrayColor];
    }
    if (range<20) {
        UILabel *label=[cell.textlabel objectAtIndex:0];
        label.textColor=[UIColor colorWithRed:0 green:80/255.0 blue:116/255.0 alpha:1];
    }else if (range>=20 && range<40){
        UILabel *label=[cell.textlabel objectAtIndex:1];
        label.textColor=[UIColor colorWithRed:0 green:80/255.0 blue:116/255.0 alpha:1];
    }else if (range>=40 && range<60){
        UILabel *label=[cell.textlabel objectAtIndex:2];
        label.textColor=[UIColor colorWithRed:0 green:80/255.0 blue:116/255.0 alpha:1];
    }else if (range>=60 && range<80){
        UILabel *label=[cell.textlabel objectAtIndex:3];
        label.textColor=[UIColor colorWithRed:0 green:80/255.0 blue:116/255.0 alpha:1];
    }else{
        UILabel *label=[cell.textlabel objectAtIndex:4];
        label.textColor=[UIColor colorWithRed:0 green:80/255.0 blue:116/255.0 alpha:1];
    }
}
#pragma mark- GestureRecognizer delegate
- (void)dealloc {
    [_tableView release];
    [_searchBar release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
}
-(void)ChooseCelebrationPress:(id)sender{
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:[sender superview] withPopoverArrow:UIPopoverArrowDirectionDown withDelegate:(id)self WithTag:3];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    
}
#pragma mark-action
-(void)pressChooseModify1:(id)sender{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0   inSection:1];
    TBModifyMenuCell2 *cell=(TBModifyMenuCell2*)[_tableView cellForRowAtIndexPath:indexPath];
    for (UIButton *btn in cell.btnSelection) {
        [btn setSelected:NO];
    }
    [sender setSelected:YES];

}
-(void)pressChooseModify2:(id)sender{
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1   inSection:1];
    TBModifyMenuCell2 *cell=(TBModifyMenuCell2*)[_tableView cellForRowAtIndexPath:indexPath];
    for (UIButton *btn in cell.btnSelection) {
        [btn setSelected:NO];
    }
    [sender setSelected:YES];
    
}
- (IBAction)cancelPress:(id)sender {
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         self.view.alpha=0;
                     }
                     completion:^(BOOL finished){
                         [self.view removeFromSuperview];
                     }];
}

- (IBAction)donePress:(id)sender {
    [self cancelPress:nil];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
@end
