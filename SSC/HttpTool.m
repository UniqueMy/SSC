//
//  HttpTool.m
//  SSC
//
//  Created by mac on 16/9/8.
//  Copyright © 2016年 Hao Sheng. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool

+ (void)postWithUrl:(NSString*)urlStr params:(NSDictionary*)params body:(NSArray *)body progress:(ProgressBlock)progress success:(SuccessBlock)success
{
    // 初始化Manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 2.设置返回类型
    manager.responseSerializer    = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    // 设置请求类型
    [manager.requestSerializer setValue:@"application/json;version=V3" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"IOS" forHTTPHeaderField:@"PLATFORM"];
    
    [manager POST:urlStr parameters:params constructingBodyWithBlock:^(id  _Nonnull formData) {
        // 拼接data到请求体，这个block的参数是遵守AFMultipartFormData协议的。
        
        if (body) {
            for (NSDictionary *dict in body) {
                
                NSString *name = [dict allKeys][0];
                [formData appendPartWithFileData:dict[name] name:name fileName:@"upload.png" mimeType:@"png"];
                
            }
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前的数据请求的进度
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        // 请求成功，解析数据
        if (success) {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
            
            
            
            // 任何情况 返回数据 并打印数据
            success(dict);
          //  NSLog(@"打印 URL %@  Data %@",urlStr,dict);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
}

+(NSMutableArray *)readCSVDataWithNSString:(NSString *)string{
    NSMutableArray *_InfoArray;
    if (_InfoArray) {
        return NULL;
    }
    _InfoArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    
    
    NSString *filepath=[[NSBundle mainBundle] pathForResource:string ofType:@"csv"];
    FILE *fp=fopen([filepath UTF8String], "r");
   
    if (fp) {
        char buf[BUFSIZ];
        fgets(buf, BUFSIZ, fp);
        while (!feof(fp)) {
            char buf[BUFSIZ];
            fgets(buf, BUFSIZ, fp);
            
            // 处理文本信息 转化 成 数组文件
            NSString *s=[[NSString alloc]initWithUTF8String:(const char *)buf];
            NSString *ss=[s stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            ss=[ss stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            
           
            
            [_InfoArray addObject:ss];
        }
    }
    return _InfoArray;
}

@end
