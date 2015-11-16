//
//  URLTools.m
//  WJL-Watercress
//
//  Created by 王剑亮 on 15/9/30.
//  Copyright (c) 2015年 wangjianliang. All rights reserved.
//

#import "URLTools.h"
#import "JSONKit.h"
@implementation URLTools


+(void)GetdataURL:(NSString *)strURL block:(void (^)(id object))Blockdata
{
    
    NSString *urlstr = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlstr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //默认为get
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil) {
            
            id obj;
            obj = [data objectFromJSONData];
            if (obj == nil)
            {
              //如果是图片解析不出来 直接返回数据
              Blockdata(data);
            }else
            {
              //把解析回去的数据 返回
              Blockdata(obj);
            }

        }
    }];
}


+(void)PostdataURL:(NSString *)strURL datastring:(NSString *)parmaStr block:(void (^)(id object))Blockdata
{
    //这里边进行了一下转码 因为可能有中文
    NSString *strURL1 = [strURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:strURL1];
    
    //携带参数 指定那个 get 还是 post 发起链接之前是没有区别的
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];

    //post 请求的body 一定要通过UTF-8进行转码 get在使用中不需要body 只有POST需要
    NSData *parmaData = [parmaStr dataUsingEncoding:NSUTF8StringEncoding ];
    
    
    //默认为get
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:parmaData];
    
    //block 回调形式的异步网络请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil) {
            
            id obj;
            obj = [data objectFromJSONData];
            if (obj == nil)
            {
                Blockdata(data);
            }else
            {
                Blockdata(obj);
            }
        }
        
    }];

}



@end
