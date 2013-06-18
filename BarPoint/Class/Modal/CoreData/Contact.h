//
//  Contact.h
//  BarPoint
//
//  Created by luan on 6/18/13.
//  Copyright (c) 2013 Luan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * emp_id;
@property (nonatomic, retain) NSString * name;

@end
