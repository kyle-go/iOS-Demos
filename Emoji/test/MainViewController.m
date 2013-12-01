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
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    
    NSArray *filesArray = [fileManager contentsOfDirectoryAtPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Emoji-Default.bundle"] error:&error];
    
    EmojiViewController *controller = [[EmojiViewController alloc] init];
    controller.contentList = filesArray;
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
