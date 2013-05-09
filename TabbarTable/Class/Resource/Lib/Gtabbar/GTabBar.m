//	GTabBar.m
//	Custom UITabBar with Images
//  Created by Daniel Hollis on 27/09/2010
//  Copyright Daniel Hollis 2010. All rights reserved.
//	Author's Personal Email vibrazy@hotmail.com
//	Author's Work Email dhollis@guerrilla.co.uk
//	Company Guerrilla Digital Media
//	Company's website: http://www.guerrillawebsitedesign.co.uk
//
//  You may use this code within your own projects.  If
//  you provide credit somewhere in your project to myself and Guerrilla Digital Media 
//  You may not use it in any tutorials, books wikis etc without asking me first.

#import "GTabBar.h"
#import "GTabTabItem.h"
#define kSelectedTab	@"SelectedTAB"
@implementation GTabBar
@synthesize tabViewControllers;
@synthesize tabItemsArray;
@synthesize tabBarHolder;
@synthesize initTab;
@synthesize delegate;

- (void)dealloc {
	[tabBarHolder release];
	[tabViewControllers release];
	[tabItemsArray release];
	[super dealloc];
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
//we are creating a view with the same bounds as the window, so it covers the whole area.
//also we are initializing the arrays that will hold the UIViewControllers and the TabBarItems
- (id)initWithTabViewControllers:(NSMutableArray *)tbControllers tabItems:(NSMutableArray *)tbItems initialTab:(int)iTab WithBackground:(UIImage*)imageBacground{
	if ((self = [super init])) {

		self.view.frame = CGRectMake(0, 0, 1024, 768);
                NSLog(@"frame :%@",NSStringFromCGRect(self.view.frame));
		initTab = iTab;
		tabViewControllers = [[NSMutableArray alloc] initWithArray:tbControllers];
		tabItemsArray = [[NSMutableArray alloc] initWithArray:tbItems];
        CGRect frame=self.view.frame;
        frame.origin.y=frame.size.height-imageBacground.size.height;
        tabBarHolder = [[UIView alloc] initWithFrame:frame];
        tabBarHolder.backgroundColor = [UIColor colorWithPatternImage:imageBacground];
	}
    self.viewControllers=tabViewControllers;
    for (int i =0; i <  [tabViewControllers count]; i++) {
		[[tabItemsArray objectAtIndex:i] setDelegate:self];
		[self.tabBarHolder addSubview:[tabItemsArray objectAtIndex:i]];
		if (i == initTab) {
			[[tabItemsArray objectAtIndex:i] toggleOn:YES];
		}
	}
	[self.view bringSubviewToFront:tabBarHolder];
	[self initialTab:initTab];
    
    return self;
}

-(void)initialTab:(int)tabIndex {
	[self activateTabItem:tabIndex];
	[self activateController:tabIndex];

}
- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.view addSubview:tabBarHolder];
    [self hideExistingTabBar];

}
//loop thru all tab bar items and set their toogle State to YES/NO
-(void)activateTabItem:(int)index {
	for (int i = 0; i < [tabItemsArray count]; i++) {
		if (i == index) {
			[[tabItemsArray objectAtIndex:i] toggleOn:YES];
		} else {
			[[tabItemsArray objectAtIndex:i] toggleOn:NO];
		}
	}
}
//loop thru all UIViewControllers items and set their toogle State to YES/NO
-(void)activateController:(int)index {
    self.selectedIndex=index;
}
//protocol used to communicate between the buttons and the tabbar
#pragma mark -
#pragma mark GTabTabItemDelegate action
- (void)selectedItem:(GTabTabItem *)button {
	int indexC = 0;
	for (GTabTabItem *tb in tabItemsArray) {
		if (tb == button) {
			[tb toggleOn:YES];
			[self activateController:indexC];;
		} else {
			[tb toggleOn:NO];
		}
		indexC++;
	}	 
}
- (void)hideExistingTabBar
{
	for(UIView *view in self.view.subviews)
	{
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}
}
@end
