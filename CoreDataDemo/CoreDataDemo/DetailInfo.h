//
//  DetailInfo.h
//  CoreDataDemo
//
//  Created by kyle on 13-11-4.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class BasicInfo;

@interface DetailInfo : NSManagedObject

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) BasicInfo *from;

@end
