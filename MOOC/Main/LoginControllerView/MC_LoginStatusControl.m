//
//  MC_LoginStatusController.m
//  MOOC
//
//  Created by 李江波 on 17/5/20.
//  Copyright © 2017年 DingYahao. All rights reserved.
//

#import "MC_LoginStatusControl.h"

@implementation MC_LoginStatusControl
static MC_LoginStatusControl* _instance = nil;
+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
        _instance.isLogin = NO;
    }) ;
    return _instance ;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [MC_LoginStatusControl shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [MC_LoginStatusControl shareInstance] ;
}

@end
