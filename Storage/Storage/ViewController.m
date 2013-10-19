//
//  ViewController.m
//  Storage
//
//  Created by kyle on 10/19/13.
//  Copyright (c) 2013 nad. All rights reserved.
//

#import "ViewController.h"
#import "SimpleStruct.h"

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray *userData;

-(NSString *)dataFilePath
{
  NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  return [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Storage.plist"];
}

-(void)loadData
{
  NSString *path = [self dataFilePath];
  if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
    NSData *d = [[NSData alloc] initWithContentsOfFile:path];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:d];
    userData = [unarchiver decodeObjectForKey:@"SimpleStruct"];
    [unarchiver finishDecoding];
  } else {
    userData = [[NSMutableArray alloc] initWithCapacity:20];
  }
}

-(void)saveData
{
  NSMutableData *d = [[NSMutableData alloc] init];
  NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:d];
  [archiver encodeObject:userData forKey:@"SimpleStruct"];
  [archiver finishEncoding];
  [d writeToFile:[self dataFilePath] atomically:YES];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
  if (self = [super initWithCoder:aDecoder]) {
    [self loadData];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  //set user's data to view
  if (userData && [userData count] == 2) {
    SimpleStruct * item = [userData objectAtIndex:0];
    self.textField1.text = item.text;
    [self.silder1 setValue:item.sider];
    
    item = [userData objectAtIndex:1];
    self.textField2.text = item.text;
    [self.silder2 setValue:item.sider];
  }
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

-(IBAction)closeKeyboard:(id)sender
{
  [sender resignFirstResponder];
}

//the action of button save
-(IBAction)save
{
  //clear userData first!
  [userData removeAllObjects];
  
  SimpleStruct * item = [[SimpleStruct alloc] init];
  item.text = self.textField1.text;
  item.sider = self.silder1.value;
  [userData addObject:item];
  
  item = [[SimpleStruct alloc] init];
  item.text = self.textField2.text;
  item.sider = self.silder2.value;
  [userData addObject:item];
  
  [self saveData];
}

@end
