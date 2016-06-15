//
//  BHButton.m
//  BHTabBar
//
//  Created by Jin on 16/6/15.
//  Copyright © 2016年 yt. All rights reserved.
//

#import "BHButton.h"

@implementation BHButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
#pragma mark 设置Button内部的image的范围
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
   
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.6;
    
    return CGRectMake((imageW - 24)/2.0, 4.5+(imageH - 24)/2.0, 24, 24);
    
    
}

#pragma mark 设置Button内部的title的范围
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
  
    CGFloat titleY = contentRect.size.height *0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY-2, titleW, titleH);
}

@end
