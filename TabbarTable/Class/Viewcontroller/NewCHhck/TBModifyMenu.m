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
@interface TBModifyMenu ()

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
        NSLog(@"fame:%@",NSStringFromCGRect(self.view.frame));
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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        TBModifyMenuCell1 *cell=[TBManageModifyMenu cellType1ForModifyMenuWithTable:aTableView WithOwer:self];
        return cell;
    }
   return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView=[[UIView alloc] init];
    headerView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bgheaderTableModify.png"]];
    return headerView;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 33;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 54;
}
#pragma mark-table action
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
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
#pragma mark- GestureRecognizer delegate
-  (void)handleSingleTap:(UITapGestureRecognizer*)tap {

}
- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
