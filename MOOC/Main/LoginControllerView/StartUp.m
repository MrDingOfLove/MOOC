//
//  CheckUser.m
//  Login
//
//  Created by Mine on 2017/4/21.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import "StartUp.h"
#import "LoginView.h"
#import "RegisterView.h"


@interface StartUp ()

@property(nonatomic,strong)UIImageView * imageView;

@end

@implementation StartUp

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加主视图背景
    [self createStartImageView];
    //添加按钮
    [self createButton];
}

//创建主视图
-(void)createStartImageView{
    _imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    _imageView.image = [UIImage imageNamed:@"Login"];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
}
//创建登录注册按钮
-(void)createButton{
    CGFloat locationX = 100;
    CGFloat ScreenWidth = CGRectGetWidth([[UIScreen mainScreen]bounds]);
    for (NSInteger i = 0; i < 2; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(locationX, 340 + i * 60, ScreenWidth - 2 * locationX, 50)];
        [button setBackgroundImage:[[UIImage imageNamed:@"btn_login_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitle:@"前往登录" forState:UIControlStateNormal];
        }else if(i == 1){
            [button setTitle:@"前往注册" forState:UIControlStateNormal];
        }
        button.tag = 100 + i;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
        button.alpha = 0.8;
        button.layer.borderWidth = 1.0;
        button.layer.borderColor = [[UIColor blackColor] CGColor] ;
        button.layer.cornerRadius = 10.0;
        button.clipsToBounds = YES;
        button.titleLabel.font = [UIFont systemFontOfSize:24];
        [_imageView addSubview:button];
        //添加返回按钮
        UIButton * back = [[UIButton alloc]initWithFrame:CGRectMake(RESIZE_UI(20), RESIZE_UI(25), RESIZE_UI(15), RESIZE_UI(15))];
        [back setImage:[UIImage imageNamed:@"back_btn"] forState:UIControlStateNormal];
        [back addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        [_imageView addSubview:back];
    }
}
-(void)back:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//按钮点击响应事件
-(void)onClick:(UIButton *)button{
    LoginView * loginView = [[LoginView alloc]initWithStartUp:self];
    loginView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    RegisterView * registerView = [[RegisterView alloc]init];
    registerView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    if (button.tag == 100) {
        [self presentViewController:loginView animated:YES completion:nil];
    }else{
        [self presentViewController:registerView animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
