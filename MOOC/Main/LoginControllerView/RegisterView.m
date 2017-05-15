//
//  CheckUser.m
//  Login
//
//  Created by Mine on 2017/4/21.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import "RegisterView.h"
#import "CheckUser.h"

@interface RegisterView ()

@end

@implementation RegisterView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetContent];
}
-(void)resetContent{
    UITextField * textfield = [self.view viewWithTag: 103];
    UIButton * button0 = [self.view viewWithTag: 104];
    UIButton * button1 = [self.view viewWithTag: 105];

    textfield.placeholder = @"请设置密码";
    [button0 setTitle:@"注册" forState:UIControlStateNormal];
    [button1 setTitle:@"注册成功?请前往登录" forState:UIControlStateNormal];

}

-(void)OnClick:(UIButton *)button{
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
        [self createAlert:@"账号密码不能为空"message:nil];
    }else if(textField.text.length == 0) {
        [self createAlert:@"账号不能为空"message:nil];
    }else if (textField0.text.length == 0){
        [self createAlert:@"密码不能为空"message:nil];
    }else{
        CheckUser * check = [[CheckUser alloc]init];
        
        [check check];
        BOOL result = check.delagate1(textField.text);
        if (result == 1) {
            [self createAlert:@"用户名已存在!"message:@"请重新输入"];
        }else{
            check.delagate0(textField.text,textField0.text);
            [self createAlert:@"已注册!请切换到登录"message:nil];
            textField.text = @"";
            textField0.text = @"";
        }
    }
}
-(void)createAlert:(NSString *)string message:(NSString *)message{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:string message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

@end
