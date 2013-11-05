//
//  KUIImageView.m
//  CustomControls
//
//  Created by kyle on 11/5/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import "KUIImageView.h"

@implementation KUIImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor redColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.masksToBounds = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetWidth(self.bounds)/2.0f;
}

+ (KUIImageView *)RoundImageView:(UIImage *)image
{
    KUIImageView *imageView = [[KUIImageView alloc] initWithImage:image];
    imageView.layer.masksToBounds = YES;
    return imageView;
}

@end
