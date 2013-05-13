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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableOderList:nil];
    [self setUitableview1:nil];
    [super viewDidUnload];
}
#pragma mark-gridview delegate
- (CGFloat) gridView:(UIGridView *)grid widthForColumnAt:(int)columnIndex
{
	return 122;
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

@end
