//
//  MasterViewController.h
//  CoreDataDemo
//
//  Created by kyle on 13-11-4.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

@end
