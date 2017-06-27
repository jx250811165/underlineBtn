//
//  ViewController.m
//  UnderlineBtnDemo
//
//  Created by 166 on 2017/6/27.
//  Copyright © 2017年 166. All rights reserved.
//

#import "ViewController.h"
#import "UnderineBtnlView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic ,strong)UIScrollView *bgSV;//滑动sv
@property (nonatomic,strong)UnderineBtnlView *headerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(200, 0, 200, 200)];
    UIView *view3= [[UIView alloc]initWithFrame:CGRectMake(400, 0, 200, 200)];
    
    view1.backgroundColor = [UIColor blueColor];
    view2.backgroundColor = [UIColor redColor];
    view3.backgroundColor = [UIColor brownColor];
    [self.bgSV addSubview:view1];
    [self.bgSV addSubview:view2];
    [self.bgSV addSubview:view3];
    
    
    self.headerView = [[UnderineBtnlView alloc]initWithFrame:CGRectMake(10, 40, 300, 48) andTitle:@[@"btn1",@"btn2",@"btn3"]];

    self.headerView.backgroundColor = [UIColor colorWithRed:0.81 green:0.94 blue:0.84 alpha:1.00];
    [self.view addSubview:self.headerView];
    
    __weak __typeof(self) weakSelf = self;
    
    self.headerView.underlineBlcok = ^(NSInteger btn){
    
        NSLog(@"点击了第几个btn%ld",btn);
        [weakSelf HeaderBtnBlock:btn];
    
    };
    

}





#pragma mark -btn点击事件
-(void)HeaderBtnBlock:(NSInteger)btnTag{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        
        self.bgSV.contentOffset = CGPointMake(200*btnTag, 0);
    }];
    
}

#pragma mark -UIScrollViewDelegate


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    
    
    int pageNo= scrollView.contentOffset.x/scrollView.frame.size.width;
    
    [self.headerView chageLine:pageNo];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIScrollView *)bgSV
{
    if (!_bgSV) {
        _bgSV = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 90, 200, 200)];
        _bgSV.contentSize = CGSizeMake(600, 0);
        _bgSV.pagingEnabled = YES;
        _bgSV.delegate = self;
        _bgSV.directionalLockEnabled = YES;
        _bgSV.bounces = NO;
        _bgSV.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_bgSV];
        
    }
    return _bgSV;
}

@end
