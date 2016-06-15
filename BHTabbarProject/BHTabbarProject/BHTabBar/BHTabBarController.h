//
//  BHTabBarController.h
//  BHTabBar
//
//  Created by Jin on 16/6/15.
//  Copyright © 2016年 yt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BHTabBarController : UITabBarController

@property (nonatomic , assign)UIColor *titleColorNormal;        //正常状态下字的颜色

@property (nonatomic , assign)UIColor *titleColorHighlighted;   //高亮状态下字体的颜色

@property (nonatomic , assign)UIColor *titleColorSelected;      //被选中字体的颜色

@property (nonatomic , assign)NSUInteger titleFont;             //字号

//初始化

-(void)initSubViewsWithArray:(NSArray *)array
              imageNameArray:(NSArray *)imageNameArray
        imageSelectNameArray:(NSArray *)imageSelectNameArray;

//显示哪个控制器

-(void)buttonWithIndex:(NSUInteger)index;

//隐藏tabBar

-(void)hiddenTabbar:(BOOL)hiden;

@end
