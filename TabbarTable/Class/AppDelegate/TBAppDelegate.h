//
//  TBAppDelegate.h
//  TabbarTable
//
//  Created by luan on 5/8/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTabBar.h"
#import "TBHomeScreen.h"
#import "TBEmployee.h"
#import "TBNewCheck.h"
#import "TBPrint.h"
#import "TBReport.h"
#import "TBLogin.h"
@class TBViewController;
@class GTabBar;
@interface TBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic) GTabBar *tabbarView;
@property(strong,nonatomic) UINavigationController *ncHomeScreen;
@property(strong,nonatomic) UINavigationController *ncEmployee;
@property(strong,nonatomic) UINavigationController *ncReport;
@property(strong,nonatomic) UINavigationController *ncPrint;
@property(strong,nonatomic) UINavigationController *ncNewcheck;
@property(strong,nonatomic) TBLogin *aTBLogin;
+ (TBAppDelegate *)shareAppDelegate;
@end
