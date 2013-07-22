//
//  API.h
//  iReporter
//
//  Created by Fahim Farook on 9/6/12.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFNetworking.h"
#import "TBAppDelegate.h"
typedef void (^JSONResponseBlock)(id result, NSError *error);

@interface API : AFHTTPClient

@property (strong, nonatomic) NSDictionary* user;

+(API*)sharedInstance;
- (void)loginWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block;
- (void)signUpWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block;
-(void)getCountryListWithCompleteBlock:(JSONResponseBlock)block;
-(void)getScheduleOfuserWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block;
-(void)getMsgOfuserWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block;
-(void)getEmpListWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block;
@end
