//
//  SimpleStruct.m
//  Storage
//
//  Created by kyle on 10/19/13.
//  Copyright (c) 2013 nad. All rights reserved.
//

#import "SimpleStruct.h"

@implementation SimpleStruct

-(id)initWithCoder:(NSCoder *)aDecoder
{
  if (self = [super init]) {
    self.sider = [aDecoder decodeDoubleForKey:@"key_double"];
    self.text = [aDecoder decodeObjectForKey:@"key_string"];
  }
  return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
  [aCoder encodeDouble:self.sider forKey:@"key_double"];
  [aCoder encodeObject:self.text forKey:@"key_string"];
}

@end