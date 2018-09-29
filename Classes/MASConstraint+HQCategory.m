//
//  MASConstraint+HQCategory.m
//  MasonryAdd
//
//  Created by 刘欢庆 on 2018/2/2.
//  Copyright © 2018年 刘欢庆. All rights reserved.
//

#import "MASConstraint+HQCategory.h"
static CGFloat _HQMASDesignWidth = 414.0;
static CGFloat _HQMASDesignHeight = 736.0;


static CGFloat _HQMASWidthRatio = 0;
static CGFloat _HQMASHeightRatio = 0;

@implementation MASConstraint (HQCategory)

+ (void)load
{
    _HQMASWidthRatio = ([[UIScreen mainScreen] bounds].size.width / _HQMASDesignWidth);
    _HQMASHeightRatio = ([[UIScreen mainScreen] bounds].size.height / _HQMASDesignHeight);
}

- (MASConstraint * (^)(CGFloat))hq_offset {
    return ^id(CGFloat offset){
        MASViewConstraint *constraint = (MASViewConstraint *)self;
        if(
           constraint.firstViewAttribute.layoutAttribute == NSLayoutAttributeTop
           || constraint.firstViewAttribute.layoutAttribute == NSLayoutAttributeBottom
           || constraint.firstViewAttribute.layoutAttribute == NSLayoutAttributeCenterY
           )
        {
            self.offset = offset * _HQMASHeightRatio;
        }
        else
        {
            self.offset = offset * _HQMASWidthRatio;
        }
        
        return self;
    };
}

- (MASConstraint * (^)(id))hq_equalTo
{
    return ^id(NSNumber *attribute) {
        
        MASViewConstraint *constraint = (MASViewConstraint *)self;
        if(constraint.firstViewAttribute.layoutAttribute == NSLayoutAttributeHeight)
        {
            attribute = @(attribute.floatValue * _HQMASHeightRatio);
        }
        else
        {
            attribute = @(attribute.floatValue * _HQMASWidthRatio);
        }
        
        return self.equalTo(attribute);
    };
}

+ (void)setDesignSize:(CGSize)size
{
    _HQMASDesignWidth = size.width;
    _HQMASDesignHeight = size.height;
    
    _HQMASWidthRatio = ([[UIScreen mainScreen] bounds].size.width / _HQMASDesignWidth);
    _HQMASHeightRatio = _HQMASWidthRatio;
}
@end
