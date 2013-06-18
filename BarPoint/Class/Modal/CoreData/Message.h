//
//  Message.h
//  BarPoint
//
//  Created by luan on 6/18/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Message : NSManagedObject

@property (nonatomic, retain) NSString * iD;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * entered_by_emp_id;
@property (nonatomic, retain) NSString * dateMsg;
@property (nonatomic, retain) NSString * timeMsg;
@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSString * last_name;
@property (nonatomic, retain) NSString * readd;
@property (nonatomic, retain) NSString * seen_date;
@property (nonatomic, retain) NSString * seen_time;
@property (nonatomic, retain) NSString * emp_id;

@end
