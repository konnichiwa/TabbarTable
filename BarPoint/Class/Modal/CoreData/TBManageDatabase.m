//
//  TBManageDatabase.m
//  BarPoint
//
//  Created by luan on 6/5/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import "TBManageDatabase.h"

@implementation TBManageDatabase
+(void)saveCountrytoTable:(NSArray*) arr{
       NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    [Country MR_truncateAll];
    for (NSDictionary *dict in arr) {
        Country *country=[Country MR_createInContext:localContext];
        country.iD=[dict objectForKey:@"id"];
        country.code=[dict objectForKey:@"code"];
        if (!((id)[dict objectForKey:@"description"]==[NSNull null])) {
            country.name=[dict objectForKey:@"description"];
        }
        else{
            country.name=@"unknown";
        }
        [localContext MR_save];
    }
    
}
+(Country*)getcountryWithName:(NSString*)name{
    NSPredicate *predict=[NSPredicate predicateWithFormat:@"name=[c] %@",name];
    return [Country MR_findFirstWithPredicate:predict];
}
+(void)saveLocationTypetoTable:(NSArray*) arr{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    [TypeLocation MR_truncateAll];
    for (NSDictionary *dict in arr) {
        TypeLocation *country=[TypeLocation MR_createInContext:localContext];
        country.iD=[dict objectForKey:@"id"];
        country.name=[dict objectForKey:@"nome"];
        [localContext MR_save];
    }
    
}
+(TypeLocation*)gettypeLocationWithName:(NSString*)name{
    NSPredicate *predict=[NSPredicate predicateWithFormat:@"name=[c] %@",name];
    return [TypeLocation MR_findFirstWithPredicate:predict];
}
#pragma mark-user
+(void)saveAcctoTableWithUsername:(NSString*)username password:(NSString*)pass locationid:(NSString*)locationId{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    [UserAccount MR_truncateAll];
    UserAccount *user=[UserAccount MR_createInContext:localContext];
    user.userName=username;
    user.password=pass;
    user.locationId=locationId;
    [localContext MR_save];
}
+(UserAccount*)getAccount{
    NSArray *acount=[UserAccount MR_findAll];
    if (acount!=nil) {
        return [acount objectAtIndex:0];
    }else{
        return nil;
    }
}
#pragma mark-employee
+(void)addScheduleTotable:(NSArray*)arr{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    [EmployeeSchedule MR_truncateAll];
    for (NSDictionary *dict in arr) {
      EmployeeSchedule   *aEmployeeSchedule=[EmployeeSchedule MR_createInContext:localContext];
        aEmployeeSchedule.dateSchedule=[dict objectForKey:@"date"];
        aEmployeeSchedule.duration=[dict objectForKey:@"duration"];
        aEmployeeSchedule.iD=[dict objectForKey:@"id"];
        aEmployeeSchedule.imageIn=[dict objectForKey:@"image_in"];
        
        aEmployeeSchedule.imageOut=[dict objectForKey:@"image_out"];
        aEmployeeSchedule.inTime=[dict objectForKey:@"in_time"];
        aEmployeeSchedule.outTime=[dict objectForKey:@"out_time"];
        [localContext MR_save];
    }
 
}
+(void)addMsgTotable:(NSArray*)arr{
   NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    for (NSDictionary *dict in arr) {
        NSPredicate *predict=[NSPredicate predicateWithFormat:@"iD==%@",[dict objectForKey:@"id"]];
        if ([Message MR_findFirstWithPredicate:predict]) {
            continue;
        }
        Message *newMsg=[Message MR_createInContext:localContext];
        newMsg.iD=[dict objectForKey:@"id"];
        newMsg.message=[dict objectForKey:@"message"];
        newMsg.entered_by_emp_id=[dict objectForKey:@"entered_by_emp_id"];
        newMsg.dateMsg=[dict objectForKey:@"date"];
        newMsg.timeMsg=[dict objectForKey:@"time"];
        newMsg.first_name=[dict objectForKey:@"first_name"];
        newMsg.last_name=[dict objectForKey:@"last_name"];
        newMsg.readd=[dict objectForKey:@"readd"];
        if ([dict objectForKey:@"seen_date"]!=[NSNull null]) {
            newMsg.seen_date=[dict objectForKey:@"seen_date"];
        }
        newMsg.seen_time=[dict objectForKey:@"seen_time"];
        newMsg.emp_id=[dict objectForKey:@"emp_id"];
        [localContext MR_save];
    }
}
+(void)addContactTotable:(NSArray*)arr{
    NSManagedObjectContext *localContext = [NSManagedObjectContext MR_contextForCurrentThread];
    for (NSDictionary *dict in arr) {
        NSPredicate *predict=[NSPredicate predicateWithFormat:@"emp_id==%@",[dict objectForKey:@"emp_id"]];
        if ([Contact MR_findFirstWithPredicate:predict]) {
            continue;
        }
        Contact *newContact=[Contact MR_createInContext:localContext];
        newContact.emp_id=[dict objectForKey:@"emp_id"];
        newContact.name=[dict objectForKey:@"name"];
        [localContext MR_save];
    }
}
@end
