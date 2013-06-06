//
//  EmployeeSchedule.h
//  BarPoint
//
//  Created by luan on 6/6/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EmployeeSchedule : NSManagedObject

@property (nonatomic, retain) NSString * iD;
@property (nonatomic, retain) NSString * dateSchedule;
@property (nonatomic, retain) NSString * inTime;
@property (nonatomic, retain) NSString * outTime;
@property (nonatomic, retain) NSString * duration;
@property (nonatomic, retain) NSString * imageIn;
@property (nonatomic, retain) NSString * imageOut;

@end
