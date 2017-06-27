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
typedef void (^UnderlineViewBlock)(NSInteger tag);


@property (nonatomic,strong) UILabel *lineLabel;
@property (nonatomic,copy)UnderlineViewBlock underlineBlcok;
@property (nonatomic,strong)NSMutableArray *btnArr;//按钮的数组

@property (nonatomic,assign)NSInteger page;

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSArray *)titleArr;



//如果有sc滑动页面 调用此方法传入页码则下划线随之移动
-(void)chageLine:(NSInteger)page;

@end
