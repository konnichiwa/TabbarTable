//
//  TBAppDelegate.m
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBAppDelegate.h"
@implementation TBAppDelegate
@synthesize tabbarView;
@synthesize ncEmployee;
@synthesize ncReport;
@synthesize ncHomeScreen;
@synthesize ncPrint;
@synthesize ncNewcheck;
@synthesize aTBLogin;
- (void)dealloc
{
    [_window release];
    [super dealloc];
}

+ (TBAppDelegate *)shareAppDelegate
{
    return (TBAppDelegate*)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    [self setupTabbarDidLogin];
    aTBLogin=[[TBLogin alloc] initWithNibName:@"TBLogin" bundle:nil];
    UINavigationController *ncroot=[[UINavigationController alloc] initWithRootViewController:aTBLogin];
    ncroot.navigationBarHidden=YES;
    self.window.rootViewController=ncroot;
    self.window.autoresizesSubviews=YES;
    [self.window makeKeyAndVisible];
    [TPKeyboardAvoidingScrollView class];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark- setup tabbar did login
-(void)setupTabbarDidLogin
{
    GTabTabItem *tabItem1 = [[GTabTabItem alloc] initWithFrame:CGRectMake(0, 0, 204.8, 64) normalState:@"" toggledState:@"btn_tabbar_employee_h"];
	GTabTabItem *tabItem2 = [[GTabTabItem alloc] initWithFrame:CGRectMake(204.8, 0, 204.8, 64) normalState:@"" toggledState:@"btn_tabbar_report_h"];
	GTabTabItem *tabItem3 = [[GTabTabItem alloc] initWithFrame:CGRectMake(204.8+204.8, 0, 204.8, 64) normalState:@"" toggledState:@"btn_tabbar_home_h"];
	GTabTabItem *tabItem4 = [[GTabTabItem alloc] initWithFrame:CGRectMake(204.8+204.8+204.8, 0, 204.8, 64) normalState:@"" toggledState:@"btn_tabbar_print_h"];
	GTabTabItem *tabItem5 = [[GTabTabItem alloc] initWithFrame:CGRectMake(204.8+204.8+204.8+204.8, 0, 204.8, 64) normalState:@"" toggledState:@"btn_tabbar_New-Check_h.png"];
    
    TBEmployee *aTBEmployee = [[[TBEmployee alloc] initWithNibName:@"TBEmployee" bundle:nil] autorelease];
    TBReport *aTBReport= [[[TBReport alloc] initWithNibName:@"TBReport" bundle:nil] autorelease];
    TBHomeScreen *aTBHomeScreen = [[[TBHomeScreen alloc] initWithNibName:@"TBHomeScreen" bundle:nil] autorelease];
    TBPrint *aTBPrint= [[[TBPrint alloc] initWithNibName:@"TBPrint" bundle:nil] autorelease];
    TBNewCheck *aTBNewCheck = [[[TBNewCheck alloc] initWithNibName:@"TBNewCheck" bundle:nil] autorelease];
    
    self.ncEmployee=[[[UINavigationController alloc] initWithRootViewController:aTBEmployee] autorelease];
    self.ncReport=[[[UINavigationController alloc] initWithRootViewController:aTBReport] autorelease];
    self.ncHomeScreen=[[[UINavigationController alloc] initWithRootViewController:aTBHomeScreen] autorelease];
    self.ncPrint=[[[UINavigationController alloc] initWithRootViewController:aTBPrint] autorelease];
    self.ncNewcheck=[[[UINavigationController alloc] initWithRootViewController:aTBNewCheck] autorelease];
    ncEmployee.navigationBarHidden=YES;
    ncReport.navigationBarHidden=YES;
    ncHomeScreen.navigationBarHidden=YES;
    ncPrint.navigationBarHidden=YES;
    ncNewcheck.navigationBarHidden=YES;
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] init];
	[viewControllersArray addObject: self.ncEmployee];
	[viewControllersArray addObject:self.ncReport];
	[viewControllersArray addObject:self.ncHomeScreen];
	[viewControllersArray addObject:self.ncPrint];
	[viewControllersArray addObject:self.ncNewcheck];
    NSMutableArray *tabItemsArray = [[NSMutableArray alloc] init];
	[tabItemsArray addObject:tabItem1];
	[tabItemsArray addObject:tabItem2];
	[tabItemsArray addObject:tabItem3];
	[tabItemsArray addObject:tabItem4];
	[tabItemsArray addObject:tabItem5];
    
    [tabItem1 release];
    [tabItem2 release];
    [tabItem3 release];
    [tabItem4 release];
    [tabItem5 release];
    UIImage *image=[UIImage imageNamed:@"bgtabbar.png"];
	tabbarView = [[GTabBar alloc] initWithTabViewControllers:viewControllersArray tabItems:tabItemsArray initialTab:2 WithBackground:image];
    [viewControllersArray release];
    [tabItemsArray release];
    
    
}

@end
