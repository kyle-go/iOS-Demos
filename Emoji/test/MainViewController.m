//
//  MainViewController.m
//  test
//
//  Created by kyle on 11/30/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "MainViewController.h"
#import "EmojiViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    EmojiViewController *controller = [[EmojiViewController alloc] init];
    NSMutableArray *mu = [[NSMutableArray alloc] init];
    for (int i=0; i<97; i++) {
        [mu addObject:@"afds"];
    }
    controller.contentList = mu;
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
    CGRect rect = controller.view.frame;
    rect.origin.y = 120;
    controller.view.frame = rect;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
