//
//  MASConstraint+HQCategory.h
//  MasonryAdd
//
//  Created by 刘欢庆 on 2018/2/2.
//  Copyright © 2018年 刘欢庆. All rights reserved.
//

#import <Masonry/Masonry.h>

#define hq_equalTo(...)                 hq_equalTo(MASBoxValue((__VA_ARGS__)))

@interface MASConstraint (HQCategory)
- (MASConstraint * (^)(CGFloat))hq_offset;

- (MASConstraint * (^)(id))hq_equalTo;
- (void)setDesignSize:(CGSize)size;
@end
