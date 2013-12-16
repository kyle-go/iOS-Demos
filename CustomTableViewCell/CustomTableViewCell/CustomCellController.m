//
//  CustomCell.m
//  CustomTableViewCell
//
//  Created by kyle on 13-11-1.
//  Copyright (c) 2013年 kyle. All rights reserved.
//

#import "CustomCellController.h"

@implementation CustomCellController {
    NSInteger height;
}

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

- (NSInteger)updateViewWithCustomCellData:(CustomCellData *)cellData {
    self.image.image = [UIImage imageNamed:cellData.image];
    self.name.text = cellData.name;
    self.sign.text = cellData.sign;
    self.weibo.text = cellData.weibo;
    
    //set cell weibo's height
    [self.weibo sizeToFit];
    
    //for no reload table view;
    if (height == self.weibo.frame.size.height) {
        return 0;
    }
    
    //get cell weibo's height
    height = self.weibo.frame.size.height;
    
    //set button position
    CGRect oldRectForward = CGRectMake(26, 97, 47, 30);
    oldRectForward.origin.y += height - 17;
    [self.btnForward setFrame:oldRectForward];
    
    CGRect oldRectComment = CGRectMake(126, 97, 47, 30);
    oldRectComment.origin.y += height - 17;
    [self.btnComment setFrame:oldRectComment];
    
    CGRect oldRectCool = CGRectMake(226, 97, 32, 30);
    oldRectCool.origin.y += height - 17;
    [self.btnCool setFrame:oldRectCool];
    
    return height + 110;
}

@end
