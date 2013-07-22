//
//  ShowClientScreen.m
//  TabbarTable
//
//  Created by luan on 5/13/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "ShowClientScreen.h"
#import "TBAppDelegate.h"
#import "DetailClient.h"
@interface ShowClientScreen ()

@end

@implementation ShowClientScreen

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
    _searchBar.backgroundColor=[UIColor clearColor];
    [[_searchBar.subviews objectAtIndex:0] removeFromSuperview];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma table delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgCellShowClient.png"]];
    cell.imageView.image=[UIImage imageNamed:@"testAvatarShowClient.png"];
    cell.textLabel.text=@"Christian Ri Phoenix";
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.textLabel.textColor=[UIColor darkGrayColor];
    cell.detailTextLabel.text=@"CA | +1 (131) 133-8023";
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 47;
}
#pragma mark
#pragma selected table
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (void)dealloc {
    [_searchBar release];
    [_tableView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSearchBar:nil];
    [self setTableView:nil];
    [super viewDidUnload];
}
- (IBAction)submitPress:(id)sender {
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

- (IBAction)addClientPress:(id)sender {
    DetailClient *aDetailClient=[[DetailClient alloc] initWithNibName:@"DetailClient" bundle:nil];
//    [[TBAppDelegate shareAppDelegate].ncNewcheck.topViewController  presentModalViewController:aDetailClient animated:YES];
    [[TBAppDelegate shareAppDelegate].ncNewcheck pushViewController:aDetailClient animated:YES];
    [self.view removeFromSuperview];
}
@end
