//
//  Payment.m
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "Payment.h"
#import "TBOderItemCell.h"
#import "TBCheckOderCell.h"
#import "ColorPickerViewController.h"
@interface Payment ()
{
    BOOL checkbox[500];
    NSMutableArray *listItem;
}
@end

@implementation Payment

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
    // Do any additional setup after loading the view from its nib.
    listItem=[[NSMutableArray alloc] initWithObjects:@"Beer",@"Coffee",@"Dessert",@"Drinks",@"Entrée",@"Appetizer",@"Kid’s Menu",@"Liquors",@"Salads",@"Sandwiches",@"Sides",@"Soups",@"Wine",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableOderList release];
    [_uitableview1 release];
    [_cashView release];
    [_expenseTABView release];
    [_surchargeView release];
    [_debitCardView release];
    [_adjustmentView release];
    [_creditCardView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableOderList:nil];
    [self setUitableview1:nil];
    [self setCashView:nil];
    [self setExpenseTABView:nil];
    [self setSurchargeView:nil];
    [self setDebitCardView:nil];
    [self setAdjustmentView:nil];
    [self setCreditCardView:nil];
    [super viewDidUnload];
}
#pragma mark-gridview delegate
- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
	return 128;
}

- (CGFloat) gridView:(UIGridView *)grid heightForRowAt:(int)rowIndex
{
	return 161;
}

- (NSInteger) numberOfColumnsOfGridView:(UIGridView *) grid
{
	return 2;
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
    cell.btnItem.tag=rowIndex*2+columnIndex+1;
    [cell .btnItem setImage:[UIImage imageNamed:[NSString stringWithFormat:@"oderItem%@",[listItem objectAtIndex:rowIndex*2+columnIndex]]] forState:UIControlStateNormal];
    cell.nameItem.text=[listItem objectAtIndex:rowIndex*2+columnIndex];
	return cell;
}

- (void) gridView:(UIGridView *)grid didSelectRowAt:(int)rowIndex AndColumnAt:(int)colIndex
{
	NSLog(@"%d, %d clicked", rowIndex, colIndex);
}
-(void)ItemPress:(id)sender{
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
}

- (IBAction)typePayment:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Cash",@"Expense Tab",@"Surcharge",@"Debit",@"Adjustment",@"Credit Card",nil] inRect:[sender frame] inView:self.view withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:1234];
}

- (IBAction)backPress:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tickPress:(id)sender{
    checkbox[[sender tag]]=checkbox[[sender tag]]==YES?NO:YES;
    [_tableOderList reloadData];
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    if (tag==1234) {
        [self hideAllPayment];
        switch (index) {
            case 0:
                _cashView.hidden=NO;
                break;
            case 1:
                _expenseTABView.hidden=NO;
                break;
            case 2:
                _surchargeView.hidden=NO;
                break;
            case 3:
                _debitCardView.hidden=NO;
                break;
            case 4:
                _adjustmentView.hidden=NO;
                break;
            case 5:
                _creditCardView.hidden=NO;
                break;
                
            default:
                break;
        }
    }
}
-(void)hideAllPayment{
    _cashView.hidden=YES;
    _adjustmentView.hidden=YES;
    _expenseTABView.hidden=YES;
    _surchargeView.hidden=YES;
    _debitCardView.hidden=YES;
    _creditCardView.hidden=YES;
}
#pragma mark-cash Action
- (IBAction)cashTypePaymentPress:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.cashView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}
#pragma mark-adjustment Action
- (IBAction)adjustmentPress:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.adjustmentView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
    
}
- (IBAction)debittypePress:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.creditCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}
#pragma mark-debitCard
- (IBAction)debitMothPress:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.creditCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}

- (IBAction)debitYearPress:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.creditCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}
#pragma mark-debitCard1
- (IBAction)debitType1:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.debitCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}

- (IBAction)debitMoth1:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.debitCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}

- (IBAction)debitYear1:(id)sender {
    [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.debitCardView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}
- (IBAction)surchargeTypePress:(id)sender {
        [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.surchargeView withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:3];
}
@end
