//
//  SGSGeventsHeaderView.m
//  yydb
//
//  Created by 166 on 2017/4/23.
//  Copyright © 2017年 com.SG.SparklingGame. All rights reserved.
//

#import "UnderineBtnlView.h"

@interface  UnderineBtnlView ()



@end

@implementation UnderineBtnlView

-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray new];
    }
    
    return _btnArr;
    
}


- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatUIWithFrame:frame andTitle:titleArr];
        
        
    }
    return self;
}

-(void)creatUIWithFrame:(CGRect)frame andTitle:(NSArray *)titleArr{
    
    
     CGFloat btnWidth  = frame.size.width/titleArr.count;
    
    self.lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, frame.size.height-2, btnWidth-16, 2)];
    
    self.lineLabel.backgroundColor = kDefaultColor;
    [self addSubview:self.lineLabel];
    
    for (int i=0; i<titleArr.count; i++) {

        UIButton *btn = [JXUI createBt:CGRectMake(i*btnWidth, 0, btnWidth, frame.size.height-2) targ:self sel:@selector(headerViewBtnClick:) titColor:[UIColor blackColor] font:[UIFont systemFontOfSize:17] image:nil backGroundImage:nil title:titleArr[i]];
        [btn setTitleColor:kDefaultColor forState:UIControlStateSelected];
        [self.btnArr addObject:btn];
        [self addSubview:btn];
        
        
        if (i==0) {
            btn.selected = YES;
        }
    }
}


-(void)chageLine:(NSInteger)page{
    
    
    for (int i = 0; i<self.btnArr.count; i++) {
        UIButton *btn =  self.btnArr[i];
        if (page == i) {
            
            btn.selected = YES;
            [UIView animateWithDuration:0.1 animations:^{
                self.lineLabel.center = CGPointMake(btn.centerX, btn.bottom+1);
            }];
        }else{
            btn.selected = NO;
        }
        
    }
    
}




-(void)headerViewBtnClick:(UIButton *)btn{
    
    
    
    for (int i=0; i<self.btnArr.count; i++) {
      
        
        UIButton *button = self.btnArr[i];
        if (button==btn) {
            
            
            if (self.headerViewBlcok) {
                self.headerViewBlcok(i);
                NSLog(@"第几个按钮===%d",i);
            }
            button.selected = YES;
            [UIView animateWithDuration:0.2 animations:^{
                self.lineLabel.center = CGPointMake(btn.centerX, btn.bottom+1);
            }];

        }else
        {
            button.selected = NO;
        }
        
    }
    
    
  
    
    
 
}



@end
