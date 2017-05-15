//
//  CheckUser.m
//  Login
//
//  Created by Mine on 2017/4/21.
//  Copyright © 2017年 Dingyahao. All rights reserved.
//

#import "CheckUser.h"

@implementation CheckUser
- (instancetype)init
{
    self = [super init];
    if (self) {
        _myUserDic = [[NSMutableDictionary alloc]init];
        _delagate =^BOOL(NSString * name, NSString * password){
            if ([password compare:_myUserDic[name]] == NSOrderedSame) {
                return 1;
            }
            return 0;
        };
        _delagate0=^(NSString * name, NSString * password){
            NSString * userPath = [[NSBundle mainBundle]pathForResource:@"Users" ofType:@"txt"];
            NSString * record = [NSString stringWithFormat:@"Name#%@\npassword#%@\n",name,password];
            NSFileHandle * fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:userPath];
            [fileHandle seekToEndOfFile];
            NSData * data = [record dataUsingEncoding:NSUTF8StringEncoding];
            [fileHandle writeData:data];
        };
        __weak typeof(self) weakSelf = self;
        weakSelf.delagate1 =^BOOL(NSString * name){
            NSString * result = [_myUserDic objectForKey:name];
            if (result == nil) {
                return 0;
            }
            return 1;
        };
        weakSelf.delagate2 =^(NSString * name, NSString * password){
            [_myUserDic setValue:password forKey:name];
        };
    }
    return self;
}

//检查用户是否合法
-(void)check{
    [self fileContentToMyUserDic];
}

//将path下的内容读到myUserDic中
-(void)fileContentToMyUserDic{
    NSString * userPath = [[NSBundle mainBundle]pathForResource:@"Users" ofType:@"txt"];
    self.contentFromFile = [NSString stringWithContentsOfFile:userPath encoding:NSUTF8StringEncoding error:nil];
//        NSLog(@"%@",self.contentFromFile);
    NSArray<NSString*> * content = [self.contentFromFile componentsSeparatedByString:@"\n"];
//        NSLog(@"%@",content);
    if (content.count != 1) {
        for(NSUInteger i = 0;i < content.count-1 ; i += 2)
        {
            NSString * name = [content[i] substringFromIndex:5];
            NSString * password = [content[i+1] substringFromIndex:9];
            [_myUserDic setObject:password forKey:name];
        }
    }
//     NSLog(@"%@",_myUserDic);
}

//将字典内容写到文件中
-(void)contentToFile{
     NSString * userPath = [[NSBundle mainBundle]pathForResource:@"Users" ofType:@"txt"];
    NSArray * keys = [_myUserDic allKeys];
//    NSLog(@"%@",_myUserDic);
    NSMutableString * allContent = [[NSMutableString alloc]init];;
    for (NSUInteger i = 0; i < keys.count; i++) {
        NSString *key,*obj;
        key = [NSString stringWithFormat:@"Name#%@",keys[i]];
        obj = [NSString stringWithFormat:@"password#%@",[_myUserDic objectForKey:keys[i]]];
        NSString * content = [NSString stringWithFormat:@"%@\n%@\n",key,obj];
        [allContent appendString:content];
    }
    [allContent writeToFile:userPath atomically:false encoding:NSUTF8StringEncoding error:nil];
}

@end
