//
//  TBNewCheck.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBNewCheck.h"
#import "TBCheckOderCell.h"
#import "TBOderItemCell.h"
#import "TBMenuItem.h"
#import "TBModifyMenu.h"
#import "TBAppDelegate.h"
#import "TBEmployee.h"
#import "ShowClientScreen.h"
#import "Payment.h"
@interface TBNewCheck ()
{
    NSMutableArray *listItem;
    BOOL checkbox[500];
}
@end

@implementation TBNewCheck

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-  (void)handleSingleTap:(UITapGestureRecognizer*)tap {
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _searchBar.backgroundColor=[UIColor clearColor];
    [[_searchBar.subviews objectAtIndex:0] removeFromSuperview];
    _uitableview1.uiGridViewDelegate=(id)self;
    listItem=[[NSMutableArray alloc] initWithObjects:@"Beer",@"Coffee",@"Dessert",@"Drinks",@"Entrée",@"Appetizer",@"Kid’s Menu",@"Liquors",@"Salads",@"Sandwiches",@"Sides",@"Soups",@"Wine",nil];
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
	return [listItem count];
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
    [cell .btnItem setImage:[UIImage imageNamed:[NSString stringWithFormat:@"oderItem%@",[listItem objectAtIndex:rowIndex*5+columnIndex]]] forState:UIControlStateNormal];
    cell.nameItem.text=[listItem objectAtIndex:rowIndex*5+columnIndex];
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
    [cell.btnTick addTarget:self action:@selector(tickPress:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnTick.tag=indexPath.row;
    if (checkbox[indexPath.row]) {
        [cell.btnTick setImage:[UIImage imageNamed:@"tickOder.png"] forState:UIControlStateNormal];
    }else{
        [cell.btnTick setImage:[UIImage imageNamed:@"untickOder.png"] forState:UIControlStateNormal];
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
    [self gotoModifyMenu];
}
#pragma mark-action
-(void)tickPress:(id)sender{
    checkbox[[sender tag]]=checkbox[[sender tag]]==YES?NO:YES;
    [_tableOderList reloadData];
}
- (IBAction)showClientPress:(id)sender {
    [self gotoClientScreen];
}

- (IBAction)paymentPress:(id)sender {
    Payment *aPayment=[[Payment alloc] initWithNibName:@"Payment" bundle:nil];
    [self.navigationController pushViewController:aPayment animated:YES];
    [aPayment release];
}

- (IBAction)selectMenuPress:(id)sender {
                [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.view withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:1];
}

- (IBAction)selectGroupPress:(id)sender {
                [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.view withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:2];
}

- (IBAction)checkOderItemsPress:(id)sender {
    for (UIButton *btn in _btnCheckOderItems) {
        [btn setSelected:NO];
    }
    [sender setSelected:YES];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    
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
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
#pragma mark-dealloc
- (void)dealloc {
    [_searchBar release];
    [_uitableview1 release];
    [listItem release];
    [_tableOderList release];
    [_btnCheckOderItems release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setUitableview1:nil];
    [self setTableOderList:nil];
    [self setBtnCheckOderItems:nil];
    [super viewDidUnload];
}
@end
