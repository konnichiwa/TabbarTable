//
//  API.m
//  iReporter
//
//  Created by Fahim Farook on 9/6/12.
//  Copyright (c) 2012 Marin Todorov. All rights reserved.
//

#import "API.h"

//the web location of the service
#define kAPIHost @"http://www.softpoint.us"

@implementation API

@synthesize user;

#pragma mark - Singleton methods
/**
 * Singleton methods
 */
+(API*)sharedInstance {
    static API *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[API alloc] initWithBaseURL1:[NSURL URLWithString:kAPIHost]];
    });
    
    return sharedInstance;
}

#pragma mark - init
//intialize the API class with the deistination host name

- (id)initWithBaseURL1:(NSURL *)url {
    //call super init
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    return self;
}

- (void)loginWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block {
    NSMutableURLRequest *apiRequest = [self requestWithMethod:@"GET" path:@"/api2/verifyemp.php" parameters:dict];
    
    AFJSONRequestOperation* operation = [[AFJSONRequestOperation alloc] initWithRequest: apiRequest];
    [[TBAppDelegate shareAppDelegate] startSpinner:@"Loading..."];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //success!
        [[TBAppDelegate shareAppDelegate] stopSpinner];
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure :(
        [[TBAppDelegate shareAppDelegate] stopSpinner];
        block(@"",error);
    }];
    [operation start];
}
- (void)signUpWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block {
    AFHTTPClient *request=[[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kAPIHost]];
    [[TBAppDelegate shareAppDelegate] startSpinner:@""];
   [ request getPath:@"/api2/insertlocandemp.php" parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
                //success!
            [[TBAppDelegate shareAppDelegate] stopSpinner];
                block(responseObject,nil);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                //failure :(
                [[TBAppDelegate shareAppDelegate] stopSpinner];
                block(@"",error);
            }];
    NSLog(@"url:%@",dict);
    [request release];
}
-(void)getCountryListWithCompleteBlock:(JSONResponseBlock)block{
    NSMutableURLRequest *apiRequest = [self requestWithMethod:@"GET" path:@"/api2/return_countryandtype.php" parameters:nil];

    AFJSONRequestOperation* operation = [[AFJSONRequestOperation alloc] initWithRequest: apiRequest];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //success!
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure :(
        block([NSDictionary dictionary],error);
    }];
    [operation start];
}
-(void)getEmpListWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block{
    NSMutableURLRequest *apiRequest = [self requestWithMethod:@"GET" path:@"/api2/return_employees.php" parameters:dict];
    
    AFJSONRequestOperation* operation = [[AFJSONRequestOperation alloc] initWithRequest: apiRequest];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //success!
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure :(
        block([NSDictionary dictionary],error);
    }];
    [operation start];
}
-(void)getScheduleOfuserWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block{
    NSMutableURLRequest *apiRequest = [self requestWithMethod:@"GET" path:@"/api2/attendance/return_attendance.php" parameters:dict];
    
    AFJSONRequestOperation* operation = [[AFJSONRequestOperation alloc] initWithRequest: apiRequest];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //success!
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure :(
        block([NSDictionary dictionary],error);
    }];
    [operation start];
}
-(void)getMsgOfuserWithDict:(NSDictionary*)dict WithCompleteBlock:(JSONResponseBlock)block{
    NSMutableURLRequest *apiRequest = [self requestWithMethod:@"GET" path:@"/api2/attendance/return_messages.php" parameters:dict];
    
    AFJSONRequestOperation* operation = [[AFJSONRequestOperation alloc] initWithRequest: apiRequest];
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //success!
        block(responseObject,nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //failure :(
        block([NSDictionary dictionary],error);
    }];
    [operation start];
}
@end
