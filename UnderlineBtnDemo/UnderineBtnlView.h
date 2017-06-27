//
//  SGSGeventsHeaderView.h
//  yydb
//
//  Created by 166 on 2017/4/23.
//  Copyright © 2017年 com.SG.SparklingGame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnderineBtnlView : UIView

//点击按钮回调block
typedef void (^HeaderViewBlock)(NSInteger tag);


@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,copy)HeaderViewBlock headerViewBlcok;
@property (nonatomic,strong)NSMutableArray *btnArr;//按钮的数组

@property (nonatomic,assign)NSInteger page;

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray *)titleArr;


-(void)chageLine:(NSInteger)page;

@end
