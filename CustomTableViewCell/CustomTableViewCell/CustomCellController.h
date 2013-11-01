//
//  CustomCell.h
//  CustomTableViewCell
//
//  Created by kyle on 13-11-1.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellData.h"

@interface CustomCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sign;
@property (strong, nonatomic) IBOutlet UILabel *weibo;

- (IBAction)actionForward:(id)sender;
- (void)updateViewWithCustomCellData:(CustomCellData *)cellData;

@end
