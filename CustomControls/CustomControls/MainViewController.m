//
//  MainViewController.m
//  CustomControls
//
//  Created by kyle on 11/5/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"header"];
    [self.b1 setType:PBFlatIconBack];
    [self.b2 setType:PBFlatIconForward];
    [self.b3 setType:PBFlatIconMenu];
    self.b1.backgroundColor = [UIColor blackColor];
    self.b2.backgroundColor = [UIColor blackColor];
    self.b3.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
