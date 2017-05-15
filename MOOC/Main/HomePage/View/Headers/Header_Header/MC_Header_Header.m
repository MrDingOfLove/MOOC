//
//  MC_Header_Header.m
//  MOOC
//
//  Created by YunDongLi on 2017/4/22.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_Header_Header.h"
@interface MC_Header_Header()<UIScrollViewDelegate>
@property (nonatomic,strong) NSObject * data;
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) UIPageControl * pageControl;
@end
@implementation MC_Header_Header
- (instancetype)initWithFrame:(CGRect)frame data:(NSObject *)data
{
    self = [super initWithFrame:frame];
    if (self) {
        self.data = data;
        [self initForView];
    }
    return self;
}
-(void)initForView{
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
    [self addSubviewToScrollView];
    
}
-(void)addSubviewToScrollView{
    for (NSInteger i = 0; i < 5; i++) {
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*self.width, 0, self.width, self.height)];
        NSString * imageName = [NSString stringWithFormat:@"slid_%ld.jpg",i];
        imageView.image = [UIImage imageNamed:imageName];
        [self.scrollView addSubview:imageView];
    }
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat currentOffset_X = scrollView.contentOffset.x;
    NSInteger currenrPage = currentOffset_X/self.width;
    self.pageControl.currentPage = currenrPage;
}
#pragma mark setter&getter
-(UIScrollView *)scrollView{
    if (!_scrollView){
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.width , self.height)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        //设置大小为屏幕宽度*图片的个数
        _scrollView.contentSize = CGSizeMake(self.width*5, self.height);
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator=NO;
    }
    return _scrollView;
}
-(UIPageControl *)pageControl{
    if (!_pageControl){
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(self.width*3/8.0, self.height-10, self.width/4.0, RESIZE_UI(10))];
        _pageControl.numberOfPages = 5;
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor lightTextColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControl;
}
@end
