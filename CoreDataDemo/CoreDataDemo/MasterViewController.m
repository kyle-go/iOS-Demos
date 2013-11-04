//
//  MasterViewController.m
//  CoreDataDemo
//
//  Created by kyle on 13-11-4.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "MasterViewController.h"
#import "BasicInfo.h"
#import "DetailInfo.h"

@interface MasterViewController ()

@end

@implementation MasterViewController {
    NSArray* basicInfos;
}

- (void)getDataFromCoreData
{
    NSFetchRequest *fectchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BasicInfo" inManagedObjectContext:self.managedObjectContext];
    [fectchRequest setEntity:entity];
    
    NSError *error;
    basicInfos = [self.managedObjectContext executeFetchRequest:fectchRequest error:&error];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"CoreDataDemo";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddNewData)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(DeleteLastLineData)];
    
    [self getDataFromCoreData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [basicInfos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    BasicInfo *info = [basicInfos objectAtIndex:indexPath.row];
    cell.textLabel.text = info.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"NO.=%d  Score=%d, Detail=%@",
                                 [info.number intValue], [info.detail.score intValue], info.detail.detail];
    
    return cell;
}

- (void)AddNewData
{
    static int number = 9527;
    static int score = 60;
    
    BasicInfo *basic = [NSEntityDescription insertNewObjectForEntityForName:@"BasicInfo" inManagedObjectContext:self.managedObjectContext];
    basic.name = @"小喵喵";
    basic.number = [NSNumber numberWithInt:number++];
    
    DetailInfo *detail = [NSEntityDescription insertNewObjectForEntityForName:@"DetailInfo" inManagedObjectContext:self.managedObjectContext];
    detail.detail = @"小喵喵是个好孩子！";
    detail.score = [NSNumber numberWithInt:score++];
    
    basic.detail = detail;
    detail.from = basic;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Save Core Data Error=%@", error);
    }
    
    [self getDataFromCoreData];
    
    [self.tableView reloadData];
}

- (void)DeleteLastLineData
{
    NSFetchRequest *fectchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BasicInfo" inManagedObjectContext:self.managedObjectContext];
    [fectchRequest setEntity:entity];
    
    NSError *error;
    basicInfos = [self.managedObjectContext executeFetchRequest:fectchRequest error:&error];
    if ([basicInfos count]) {
        BasicInfo *basic = [basicInfos objectAtIndex:[basicInfos count] - 1];
        [self.managedObjectContext deleteObject:basic];
        
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"error:%@",error);
        } else {
            [self getDataFromCoreData];
            [self.tableView reloadData];
        }
    }
}

@end
