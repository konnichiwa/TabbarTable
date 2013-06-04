//
//  TBRestConnection.m
//  BarPoint
//
//  Created by Luannguyen2 on 6/4/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBRestConnection.h"
#import "AFJSONRequestOperation.h"
@implementation TBRestConnection
- (void)getDataWithPathSource:(NSString *)pathSource WithParam:(NSArray*)param{
    NSURL *url = [NSURL URLWithString:@"http://httpbin.org/ip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
    } failure:nil];
    
    [operation start];
}
@end
