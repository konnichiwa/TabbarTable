//
//  TBReport.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBReport.h"

@interface TBReport ()

@end

@implementation TBReport

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
    _searchBar.placeholder=@"Search";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_searchBar release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setSearchBar:nil];
    [super viewDidUnload];
}
- (IBAction)dayPress:(id)sender {
                   [[ColorPickerViewController alloc] showPoppoWitharray:[[NSMutableArray alloc] initWithObjects:@"Test",@"Test",@"Test",nil] inRect:[sender frame] inView:self.view withPopoverArrow:UIPopoverArrowDirectionUp withDelegate:(id)self WithTag:1]; 
}
-(void)selectedAtIndex:(int)index withTag:(int)tag{
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
@end
