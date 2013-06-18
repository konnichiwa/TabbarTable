//
//  TBManageDatabase.h
//  BarPoint
//
//  Created by luan on 6/5/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Country.h"
#import "UserAccount.h"
#import "TypeLocation.h"
#import "EmployeeSchedule.h"
#import "Message.h"
#import "Contact.h"
#import "CoreData+MagicalRecord.h"
@interface TBManageDatabase : NSObject
+(void)saveCountrytoTable:(NSArray*) arr;
+(void)saveLocationTypetoTable:(NSArray*)arr;
+(Country*)getcountryWithName:(NSString*)name;
+(TypeLocation*)gettypeLocationWithName:(NSString*)name;

+(void)saveAcctoTableWithUsername:(NSString*)username password:(NSString*)pass locationid:(NSString*)locationId;
+(UserAccount*)getAccount;

+(void)addScheduleTotable:(NSArray*)arr;
+(void)addMsgTotable:(NSArray*)arr;
+(void)addContactTotable:(NSArray*)arr;
@end
