//
//  BasicInfo.h
//  CoreDataDemo
//
//  Created by kyle on 13-11-4.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DetailInfo;

@interface BasicInfo : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) DetailInfo *detail;

@end
