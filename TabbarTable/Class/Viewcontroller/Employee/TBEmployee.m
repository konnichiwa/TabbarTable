//
//  TBEmployee.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBEmployee.h"

@interface TBEmployee ()

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
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellLeftEmployee.png"]];
        UILabel *datetext=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150 , 48)];
        datetext.text=@"Fri Jan 8";
        datetext.font=[UIFont systemFontOfSize:15];
        datetext.textColor=[UIColor darkGrayColor];
        datetext.backgroundColor=[UIColor clearColor];
        datetext.textAlignment=NSTextAlignmentCenter;
        [cell addSubview:datetext];
        [datetext release];
        //add dot right of animal name
        return cell;
    }else{
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
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
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLeftTableView:nil];
    [self setRightTableView:nil];
    [super viewDidUnload];
}
@end
