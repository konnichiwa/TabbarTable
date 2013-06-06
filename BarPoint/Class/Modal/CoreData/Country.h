//
//  Country.h
//  BarPoint
//
//  Created by luan on 6/5/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Country : NSManagedObject

@property (nonatomic, retain) NSString * iD;
@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSString * name;

@end
