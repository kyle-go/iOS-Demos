//
//  MainViewController.h
//  CustomControls
//
//  Created by kyle on 11/5/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KUIImageView.h"
#import "KUIButton.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet KUIImageView *imageView;
@property (weak, nonatomic) IBOutlet KUIButton *b1;
@property (weak, nonatomic) IBOutlet KUIButton *b2;
@property (weak, nonatomic) IBOutlet KUIButton *b3;

@end
