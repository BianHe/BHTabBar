//
//  BHTabBarController.m
//  BHTabBar
//
//  Created by Jin on 16/6/15.
//  Copyright © 2016年 yt. All rights reserved.
//

#import "BHTabBarController.h"
#import "BHButton.h"

@interface BHTabBarController ()

@property (nonatomic,strong)UIView *tabBarView;

@property (nonatomic , copy) NSArray *tabBarArray;

@end

@implementation BHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)initSubViewsWithArray:(NSArray *)array
              imageNameArray:(NSArray *)imageNameArray
        imageSelectNameArray:(NSArray *)imageSelectNameArray{
    
    _tabBarArray = array;
    
    self.tabBar.hidden = YES;
    
    _tabBarView = [[UIView alloc]init];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    _tabBarView.frame = CGRectMake(0, size.height - 49, size.width, 49);
    
    [_tabBarView setBackgroundColor:[UIColor whiteColor]];
    
    _tabBarView.alpha = 0.95;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, 1)];
    
    line.backgroundColor = [UIColor blackColor];
    
    [_tabBarView addSubview:line];
    
    [self.view addSubview:_tabBarView];
    
    
    int arrCount = (int)_tabBarArray.count;
    
    for (int i = 0; i < arrCount; i++) {
        
        BHButton *button = [[BHButton alloc]init];
            
        button.frame = CGRectMake(i * size.width/arrCount, 0, size.width/arrCount, 49);
        
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        button.imageView.contentMode = UIViewContentModeCenter;
        
        [button setTitle:_tabBarArray[i] forState:UIControlStateNormal];
        
        [button setTitleColor:_titleColorNormal forState:UIControlStateNormal];
        
        [button setTitleColor:_titleColorHighlighted forState:UIControlStateHighlighted];
       
        [button setTitleColor:_titleColorSelected forState:UIControlStateSelected];
        
        [button setImage:[UIImage imageNamed:imageNameArray[i]] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:imageNameArray[i]] forState:UIControlStateHighlighted];
        
        [button setImage:[UIImage imageNamed:imageSelectNameArray[i]] forState:UIControlStateSelected];
    
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        button.titleLabel.font = [UIFont systemFontOfSize:_titleFont];
        
        button.tag = 100 + i;
        
        [_tabBarView addSubview:button];
    }
    
    _tabBarView.userInteractionEnabled = YES;
    
}

-(void)buttonClicked:(UIButton *)button{
    
    int count = (int)_tabBarArray.count;
    for (int i = 0; i < count; i++) {
        UIButton *btn = (id)[self.view viewWithTag:100 + i];
        if (btn != button) {
            btn.selected = NO;
        }
    }
    UIButton * tabBarBtn = [_tabBarView viewWithTag:button.tag];
    tabBarBtn.selected = YES;
    self.selectedIndex = button.tag - 100;
}

-(void)buttonWithIndex:(NSUInteger)index{
    UIButton *btn = (id)[self.view viewWithTag:100+index];
    btn.selected = YES;
    self.selectedIndex = index;
}

-(void)hiddenTabbar:(BOOL)hiden
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        if (hiden) {
            weakSelf.tabBarView.frame = CGRectMake(0, size.height, size.width, 49);
        }
        else
        {
            weakSelf.tabBarView.frame = CGRectMake(0, size.height - 49, size.width, 49);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
