//
//  ColorPickerViewController.m
//  MathMonsters
//
//  Created by Transferred on 1/12/13.
//  Copyright (c) 2013 Designated Nerd Software. All rights reserved.
//

#import "ColorPickerViewController.h"

@implementation ColorPickerViewController
{
    UIPopoverController  *colorPickerPopover;
}
@synthesize colorNames;
#pragma mark - Init
-(id)initWithStyle:(UITableViewStyle)style
{
    if ([super initWithStyle:style] != nil) {
        //Initialize the array
        //Set up the array of colors.
        colorNames=[[NSMutableArray alloc] init];
//        [colorNames addObject:@"Red"];
//        [colorNames addObject:@"Green"];
//        [colorNames addObject:@"Blue"];
//        
        //Make row selections persist.

    }
    
    return self;
}

#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"name:%@",colorNames);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [colorNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [colorNames objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.delegate selectedAtIndex:indexPath.row withTag:self.view.tag];
    [colorPickerPopover dismissPopoverAnimated:YES];
}
- (void)showPoppoWitharray:(NSArray*)array inRect:(CGRect)rect inView:(UIView*)view withPopoverArrow:(UIPopoverArrowDirection)popoverArrow withDelegate:(id)dele WithTag:(int)tag{
    [self initWithStyle:UITableViewStylePlain];
    
    self.delegate=dele;
    self.colorNames=[NSMutableArray arrayWithArray:array];
    self.clearsSelectionOnViewWillAppear = NO;
    
    //Calculate how tall the view should be by multiplying the individual row height
    //by the total number of rows.
    NSInteger rowsCount = [colorNames count];
    NSInteger singleRowHeight = [self.tableView.delegate tableView:self.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSInteger totalRowsHeight = rowsCount * singleRowHeight;
    
    //Calculate how wide the view should be by finding how wide each string is expected to be
    CGFloat largestLabelWidth = 0;
    for (NSString *colorName in colorNames) {
        //Checks size of text using the default font for UITableViewCell's textLabel.
        CGSize labelSize = [colorName sizeWithFont:[UIFont boldSystemFontOfSize:20.0f]];
        if (labelSize.width > largestLabelWidth) {
            largestLabelWidth = labelSize.width;
        }
    }
    
    //Add a little padding to the width
    CGFloat popoverWidth = largestLabelWidth + 100;
    
    //Set the property to tell the popover container how big this view will be.
    self.contentSizeForViewInPopover = CGSizeMake(popoverWidth, totalRowsHeight);
    
    
    colorPickerPopover = [[UIPopoverController alloc] initWithContentViewController:self];
    [colorPickerPopover presentPopoverFromRect:rect   inView:view permittedArrowDirections:popoverArrow animated:YES];
    self.view.tag=tag;
    [self.tableView reloadData];

}
@end
