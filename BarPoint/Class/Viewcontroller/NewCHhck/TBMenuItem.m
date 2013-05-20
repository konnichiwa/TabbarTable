//
//  TBMenuItem.m
//  TabbarTable
//
//  Created by luan on 5/11/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBMenuItem.h"
#import "TBOderItemCell.h"
#import "TBCheckOderCell.h"
#import "Payment.h"
#import "TBAppDelegate.h"
#import "ShowClientScreen.h"
#import "TBModifyMenu.h"
@interface TBMenuItem ()
{
    BOOL checkbox1[200];
    BOOL checkbox2[200];
}
@end

@implementation TBMenuItem

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setTableListItem1:nil];
    [self setTableListItem2:nil];
    [self setGridListItem:nil];
    [super viewDidUnload];
}
- (void)viewDidLoad
{
    _searchBar.backgroundColor=[UIColor clearColor];
    [[_searchBar.subviews objectAtIndex:0] removeFromSuperview];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark-gridview delegate
- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
	return 126;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
	return 161;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
	return 5;
}


- (NSInteger) numberOfCellsOfGridView:(UIGridView *) grid
{
	return 19;
}

- (UIGridViewCell *) gridView:(UIGridView *)grid cellForRowAt:(int)rowIndex AndColumnAt:(int)columnIndex
{
	TBCheckOderCell *cell = (TBCheckOderCell *)[grid dequeueReusableCell];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBCheckOderCell class]])
                cell = (TBCheckOderCell *)oneObject;
    }
    [cell.btnItem addTarget:self action:@selector(ItemPress:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnItem.tag=rowIndex*5+columnIndex+1;
    [cell .btnItem setImage:[UIImage imageNamed:[NSString stringWithFormat:@"item%d",rowIndex*5+columnIndex+1]] forState:UIControlStateNormal];
    cell.nameItem.text=[NSString stringWithFormat:@"Item %d",rowIndex*5+columnIndex+1];
	return cell;
}

- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)colIndex
{
	NSLog(@"%d, %d clicked", rowIndex, colIndex);
}
-(void)ItemPress:(id)sender{
    NSLog(@"tag:%d",[sender tag]);
    TBMenuItem *aTBMenuItem=[[[TBMenuItem alloc] initWithNibName:@"TBMenuItem" bundle:nil] autorelease];
    [self.navigationController pushViewController:aTBMenuItem animated:YES];
}
#pragma mark- table delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"TBOderItemCell";
    TBOderItemCell *cell = (TBOderItemCell *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib){
            if ([oneObject isKindOfClass:[TBOderItemCell class]])
                cell = (TBOderItemCell *)oneObject;
        }
    }
    if (aTableView==_tableListItem1) {
        [cell.btnTick addTarget:self action:@selector(tickPress1:) forControlEvents:UIControlEventTouchUpInside];
        cell.btnTick.tag=indexPath.row;
        if (checkbox1[indexPath.row]) {
            [cell.btnTick setImage:[UIImage imageNamed:@"tickOder.png"] forState:UIControlStateNormal];
        }else{
            [cell.btnTick setImage:[UIImage imageNamed:@"untickOder.png"] forState:UIControlStateNormal];
        }
    }
    if (aTableView==_tableListItem2) {
        [cell.btnTick addTarget:self action:@selector(tickPress2:) forControlEvents:UIControlEventTouchUpInside];
        cell.btnTick.tag=indexPath.row;
        if (checkbox2[indexPath.row]) {
            [cell.btnTick setImage:[UIImage imageNamed:@"tickOder.png"] forState:UIControlStateNormal];
        }else{
            [cell.btnTick setImage:[UIImage imageNamed:@"untickOder.png"] forState:UIControlStateNormal];
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 28;
}
#pragma mark
#pragma selected table
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark-action
-(void)tickPress1:(id)sender{
    checkbox1[[sender tag]]=checkbox1[[sender tag]]==YES?NO:YES;
    [_tableListItem1 reloadData];
}
-(void)tickPress2:(id)sender{
    checkbox2[[sender tag]]=checkbox2[[sender tag]]==YES?NO:YES;
    [_tableListItem2 reloadData];
}

- (void)dealloc {
    [_searchBar release];
    [_tableListItem1 release];
    [_tableListItem2 release];
    [_gridListItem release];
    [super dealloc];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)paymentPress:(id)sender {
    Payment *aPayment=[[Payment alloc] initWithNibName:@"Payment" bundle:nil];
    [self.navigationController pushViewController:aPayment animated:YES];
    [aPayment release];
}

- (IBAction)showClientPress:(id)sender {
    [self gotoClientScreen];
}

- (IBAction)modifyPress:(id)sender {
    [self gotoModifyMenu];
}
-(void)gotoClientScreen{
    ShowClientScreen *aTBModifyMenu=[[ShowClientScreen alloc] initWithNibName:@"ShowClientScreen" bundle:nil];
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:aTBModifyMenu.view];
    [aTBModifyMenu.view setNeedsDisplay];
    aTBModifyMenu.view.frame=CGRectMake(0, 0, 1024, 768);
    aTBModifyMenu.view.alpha=0;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         aTBModifyMenu.view.alpha=1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
}
-(void)gotoModifyMenu{
    TBModifyMenu *aTBModifyMenu=[[TBModifyMenu alloc] initWithNibName:@"TBModifyMenu" bundle:nil];
    [[TBAppDelegate shareAppDelegate].tabbarView.view addSubview:aTBModifyMenu.view];
    [aTBModifyMenu.view setNeedsDisplay];
    aTBModifyMenu.view.frame=CGRectMake(0, 0, 1024, 768);
    aTBModifyMenu.view.alpha=0;
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         aTBModifyMenu.view.alpha=1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
}
@end
