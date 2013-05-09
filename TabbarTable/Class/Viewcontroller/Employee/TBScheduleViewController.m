//
//  TBScheduleViewController.m
//  TabbarTable
//
//  Created by luan on 5/9/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBScheduleViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <QuartzCore/CAAnimation.h>
@interface TBScheduleViewController ()
{
    UIView *imageview;
}
@end

@implementation TBScheduleViewController

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
    imageview=[[UIView alloc] initWithFrame:CGRectMake(0 , 0, 0, 0)];
    imageview.backgroundColor=[UIColor blackColor];
    [self.view addSubview:imageview];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{


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

        return 20;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
                cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"schedulecell.png"]];
    cell.textLabel.text=@"Wed Jan 23";
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.textColor=[UIColor darkGrayColor];

//    cell.textLabel.frame=CGRectMake(0, 0, 360, 48);
//    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(200, 0, 300, 48)];
    label.text=@"09:00 - 17:00: Bar Manager \n11:00: Marketing & Sales Meeting ";
    label.font=[UIFont systemFontOfSize:15];
    label.textColor=[UIColor darkGrayColor];
    label.backgroundColor=[UIColor clearColor];
    label.numberOfLines=2;
    [cell addSubview:label];
    [label release];
    return cell;
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
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
- (IBAction)btnBackEmployee:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backBtn:(id)sender {
        [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)infoPress:(id)sender{
    imageview.alpha=0;
    CGRect frame=CGRectMake(self.view.center.x-250, self.view.center.y-250, 500, 500);
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         imageview.frame=frame;
                         imageview.alpha=1;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}
-(void)verticalFlipWithView:(UIView*)yourView{
    
//    [UIView animateWithDuration:0.5 delay:0.1 animations:^{
////        yourView.transform = CATransform3DMakeRotation(M_PI_2,1.0,0.0,0.0); //flip halfway
//    } completion:^{
////        while ([yourView.subviews count] > 0)
////            [[yourView.subviews lastObject] removeFromSuperview]; // remove all subviews
////        // Add your new views here
////        [UIView animateWithDuration:someDuration delay:someDelay animations:^{
////            yourView.transform = CATransform3DMakeRotation(M_PI,1.0,0.0,0.0); //finish the flip
////        } completion:^{
////            // Flip completion code here
////        }];
//    }];
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}@end
