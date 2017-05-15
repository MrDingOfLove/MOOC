//
//  CheckUser.m
//  Login
//
//  Created by Mine on 2017/4/21.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import "LoginView.h"
#import "CheckUser.h"
#import "StartUp.h"
@interface LoginView ()
@property (nonatomic,strong) StartUp * startUp;
@end

@implementation LoginView
- (instancetype)initWithStartUp:(StartUp *)startUp
{
    self = [super init];
    if (self) {
        self.startUp = startUp;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //背景
    [self createImageView];
    //文本输入框
    [self createTextField];
    //登录按钮
    [self createLoginButton];
}
//创建背景
-(void)createImageView{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    imageView.image = [UIImage imageNamed:@"Login"];
    imageView.alpha = 0.5;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
}

//创建文本输入框
-(void)createTextField{
    for (NSInteger i = 0; i < 2; i++) {
        //创建输入框
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(50,200+i * 46, CGRectGetWidth([[UIScreen mainScreen]bounds]) - 100, 47)];
        textField.tag = 102 + i;
        //键盘色调显示风格
        textField.keyboardAppearance = UIKeyboardAppearanceAlert;
        //键盘最上面一栏
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        //默认开始大写关闭
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.clearButtonMode = UITextFieldViewModeAlways;
        
        //创建底部imageView
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,200+ i * 46, CGRectGetWidth([[UIScreen mainScreen]bounds]), 45)];
        
        
        if (i == 0) {
            imageView.image = [UIImage imageNamed:@"name_bg"];
            textField.placeholder = @"请填写账号或用户名";
        }else{
            imageView.image =[UIImage imageNamed:@"password_bg"];
            textField.placeholder = @"输入密码";
            textField.secureTextEntry = YES;
        }
        [textField setValue:[UIColor colorWithRed:255 green:255 blue:255 alpha:0.5] forKeyPath:@"_placeholderLabel.textColor"];
        textField.textColor = [UIColor whiteColor];
        [self.view addSubview:imageView];
        [self.view addSubview:textField];
    }
}
-(void)createLoginButton{
    CGFloat screenWidth = CGRectGetWidth([[UIScreen mainScreen]bounds]);
    CGFloat locationX = 80;
    for (NSInteger i = 0; i < 2; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(locationX, 320 + i * 55, screenWidth - 2 * locationX, 45)];
        button.layer.cornerRadius = 5.0;
        //注意是backgroundImage
        if (i == 0) {
            [button setBackgroundImage:[[UIImage imageNamed:@"btn_login_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forState:UIControlStateNormal];
            [button setTitle:@"登录" forState:UIControlStateNormal];
            button.backgroundColor = [UIColor lightTextColor];
            button.titleLabel.font = [UIFont systemFontOfSize:20];
        }else{
            [button setTitle:@"没有用户名?请前往注册" forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
        }
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.clipsToBounds = YES;
        button.tag = 104+i;
        
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
}
-(void)onClick:(UIButton *)button{
    UITextField * textField0 = [self.view viewWithTag:102];
    UITextField * textField1 = [self.view viewWithTag:103];
    [textField0 resignFirstResponder];
    [textField1 resignFirstResponder];
    if(button.tag == 105)
        [self dismissViewControllerAnimated:YES completion:nil];
    else{
        [self check];
    }
}
-(void)check{
    UITextField * textField = (UITextField *)[self.view viewWithTag:102];
    UITextField * textField0 = (UITextField *)[self.view viewWithTag:103];
    [textField resignFirstResponder];
    [textField0 resignFirstResponder];
    if (textField.text.length == 0&&textField0.text.length == 0) {
        [self createAlert:@"账号密码不能为空"];
    }else if(textField.text.length == 0) {
        [self createAlert:@"账号不能为空"];
    }else if (textField0.text.length == 0){
        [self createAlert:@"密码不能为空"];
    }else{
        CheckUser * check = [[CheckUser alloc]init];
        [check check];
        BOOL result = check.delagate(textField.text,textField0.text);
        if(result == 1){
            [self toMainScreenWithName:textField.text passWord:textField0.text];
        }else{
            [self createAlert:@"账号与密码不正确"];
        }
    }
}
-(void)createAlert:(NSString *)string{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:string message:@"请重新填写" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)toMainScreenWithName:(NSString *)name passWord:(NSString *)password{
    [self dismissViewControllerAnimated:YES completion:^{
        [self.startUp dismissViewControllerAnimated:YES completion:nil];
    }];
    [self.startUp.delegate changeHeader];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITextField * textField0 = [self.view viewWithTag:102];
    UITextField * textField1 = [self.view viewWithTag:103];
    [textField0 resignFirstResponder];
    [textField1 resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)viewWillAppear:(BOOL)animated{
    UITextField * textField = (UITextField *)[self.view viewWithTag:102];
    UITextField * textField0 = (UITextField *)[self.view viewWithTag:103];
    textField.text = nil;
    textField0.text = nil;
}

@end
