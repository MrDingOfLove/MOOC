//
//  MC_LoginStatusController.h
//  MOOC
//
//  Created by 李江波 on 17/5/20.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MC_LoginStatusControl : NSObject
@property(assign,nonatomic)BOOL isLogin;
+(instancetype) shareInstance;
@end
