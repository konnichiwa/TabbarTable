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
            return cell;
        }
            break;
        case 2:
        {        TBModifyMenuCell3 *cell=[TBManageModifyMenu cellType3ForModifyMenuWithTable:aTableView WithOwer:self];
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
    if ((indexPath.section==3)&&(indexPath.row==2)) {
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
