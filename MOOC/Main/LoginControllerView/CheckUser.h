//
//  CheckUser.m
//  Login
//
//  Created by Mine on 2017/4/21.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUser : NSObject

@property(nonatomic,retain)NSString *contentFromFile;//从文件读取的内容
@property(nonatomic)NSMutableDictionary * myUserDic;//存放User信息的字典
@property(nonatomic,copy)BOOL(^delagate)(NSString * name,NSString * passWord);

@property(nonatomic,copy)void(^delagate0)(NSString * name,NSString * passWord);
@property(nonatomic,copy)BOOL(^delagate1)(NSString * name);
@property(nonatomic,copy)void(^delagate2)(NSString * name,NSString * passWord);
-(void)check;
-(void)fileContentToMyUserDic;
-(void)contentToFile;

@end
