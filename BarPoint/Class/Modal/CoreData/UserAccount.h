//
//  UserAccount.h
//  BarPoint
//
//  Created by luan on 6/5/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserAccount : NSManagedObject

@property (nonatomic, retain) NSString * locationId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * typeAccess;

@end
