//
//  KUIButton.h
//  CustomControls
//
//  Created by kyle on 11/5/13.
//  Copyright (c) 2013 kyle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PBFlatIconAdd,
    PBFlatIconBack,
    PBFlatIconForward,
    PBFlatIconSearch,
    PBFlatIconMenu,
    PBFlatIconMore,
} KButtonType;

@interface KUIButton : UIButton

@property (assign, nonatomic) KButtonType type;
@property (strong, nonatomic) UIColor *backgroundColor;

@end
