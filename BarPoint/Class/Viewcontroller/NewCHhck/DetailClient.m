//
//  DetailClient.m
//  BarPoint
//
//  Created by luan on 5/21/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "DetailClient.h"

@interface DetailClient ()
{
    NSMutableArray *headerTit1;
    NSMutableArray *headerTit2;
}
@end

@implementation DetailClient

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
    _tableView1.backgroundColor=[UIColor clearColor];
    _tableView2.backgroundColor=[UIColor clearColor];
    headerTit1=[[NSMutableArray alloc] initWithObjects:@"Client Name",@"Client Information",@"Client Phone",@"",nil];
    headerTit2=[[NSMutableArray alloc] initWithObjects:@"Client Email",@"",@"Client Address",@"",nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_backPress release];
    [_NameViewSection release];
    [_infomationViewSection release];
    [_addPhoneViewSection release];
    [_tableView1 release];
    [_newEmailViewSection release];
    [_addAddressView release];
    [_tableView2 release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setBackPress:nil];
    [self setNameViewSection:nil];
    [self setInfomationViewSection:nil];
    [self setAddPhoneViewSection:nil];
    [self setTableView1:nil];
    [self setNewEmailViewSection:nil];
    [self setAddAddressView:nil];
    [self setTableView2:nil];
    [super viewDidUnload];
}
#pragma mark -
#pragma mark - table delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView==_tableView1) {
        return 4;
    }
    if (tableView==_tableView2) {
        return 4;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView==_tableView1) {
        return 1;
    }
    if (tableView==_tableView2) {
        return 1;
    }
    return 1;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    aTableView.backgroundColor=[UIColor clearColor];
    aTableView.separatorColor=[UIColor clearColor];
    if (aTableView==_tableView1) {
        switch (indexPath.section) {
            case 0:
            {
                UITableViewCell *cell=[self nomalCellForTable:aTableView];
                [cell addSubview:_NameViewSection];
                return cell;
            }
                break;
            case 1:
            {
                UITableViewCell *cell=[self nomalCellForTable:aTableView];
                [cell addSubview:_infomationViewSection];
                return cell;
            }
                break;
            case 2:
            {
                TBAddClientCell *cell=[self customcellForTable:aTableView];
                return cell;
               
            }
                break;
            case 3:
            {
                UITableViewCell *cell=[self nomalCellForTable:aTableView];
                [cell addSubview:_addPhoneViewSection];
                return cell;
                
            }
                break;
                
            default:
                break;
        }
    }
    if (aTableView==_tableView2) {
        switch (indexPath.section) {
            case 0:
            {
                TBAddClientCell *cell=[self customcellForTable:aTableView];
                return cell;
                return cell;
            }
                break;
            case 1:
            {
                UITableViewCell *cell=[self nomalCellForTable:aTableView];
                [cell addSubview:_newEmailViewSection];
                return cell;
            }
                break;
            case 2:
            {
                TBAddClientCell *cell=[self customcellForTable:aTableView];
                return cell;
                
            }
                break;
            case 3:
            {
                UITableViewCell *cell=[self nomalCellForTable:aTableView];
                [cell addSubview:_addAddressView];
                return cell;
                
            }
                break;
                
            default:
                break;
        }
    }       return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    if (tableView==_tableView1) {
        UIView *headerView=[[UIView alloc] init];
        UILabel *textTitle=[[UILabel alloc] init];
        textTitle.frame=CGRectMake(8, 0, 376, 30);
        textTitle.textAlignment=NSTextAlignmentLeft;
        textTitle.text=[headerTit1 objectAtIndex:section];
        textTitle.textColor=[UIColor whiteColor];
        textTitle.font=[UIFont boldSystemFontOfSize:17];
        textTitle.backgroundColor=[UIColor clearColor];
        [headerView addSubview:textTitle];
        [textTitle release];
        if (section==2) {
            UIImageView *addImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addclientbtnAdd.png"]];
            addImage.frame=CGRectMake(345, -2, 31, 34);
            [headerView addSubview:addImage];
            
        }
        return headerView;
    }else{
        UIView *headerView=[[UIView alloc] init];
        UILabel *textTitle=[[UILabel alloc] init];
        textTitle.frame=CGRectMake(8, 0, 376, 30);
        textTitle.textAlignment=NSTextAlignmentLeft;
        textTitle.text=[headerTit2 objectAtIndex:section];
        textTitle.textColor=[UIColor whiteColor];
        textTitle.font=[UIFont boldSystemFontOfSize:17];
        textTitle.backgroundColor=[UIColor clearColor];
        [headerView addSubview:textTitle];
        if (section==2||section==0) {
            UIImageView *addImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addclientbtnAdd.png"]];
            addImage.frame=CGRectMake(345, -2, 31, 34);
            [headerView addSubview:addImage];
            
        }
        [textTitle release];
        return headerView;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView==_tableView1) {
        switch (indexPath.section) {
            case 0:
                return 160;
                break;
            case 1:
                return 161;
                break;
            case 2:
                return 39;
                break;
            case 3:
                return 106;
                break;
            default:
                break;
        }
    }
    if (tableView==_tableView2) {
        switch (indexPath.section) {
            case 0:
                return 39;
                break;
            case 1:
                return 106;
                break;
            case 2:
                return 39;
                break;
            case 3:
                return 267;
                break;
            default:
                break;
        }
    }
    
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==3 && (tableView==_tableView1)) {
        return 0;
    }
    if (((section==3)||(section==1))&&(tableView==_tableView2) ) {
        return 0;
    }
    return 30;
}
#pragma mark-table action
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UITableViewCell*)nomalCellForTable:(UITableView*)table{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(TBAddClientCell*)customcellForTable:(UITableView*)aTableView{
    static NSString *indentifier = @"TBAddClientCell";
    TBAddClientCell *cell = (TBAddClientCell *)[aTableView dequeueReusableCellWithIdentifier: indentifier];
    //cell = nil;
    if (cell == nil)  {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell"
                                                     owner:self options:nil] ;
        for (id oneObject in nib)
            if ([oneObject isKindOfClass:[TBAddClientCell class]])
                cell = (TBAddClientCell *)oneObject;
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;

}
- (IBAction)backPress:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
