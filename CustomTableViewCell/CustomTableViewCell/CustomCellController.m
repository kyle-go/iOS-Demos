//
//  CustomCell.m
//  CustomTableViewCell
//
//  Created by kyle on 13-11-1.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "CustomCellController.h"

@implementation CustomCellController

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)actionForward:(id)sender {
}

- (void)updateViewWithCustomCellData:(CustomCellData *)cellData {
    self.image.image = [UIImage imageNamed:cellData.image];
    self.name.text = cellData.name;
    self.sign.text = cellData.sign;
    self.weibo.text = cellData.weibo;
}

@end
