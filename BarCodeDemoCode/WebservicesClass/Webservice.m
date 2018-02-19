//
//  Webservice.m
//  BarCode Demo
//
//  Created by shikha  on 14/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "Webservice.h"

@implementation Webservice

-(void)getData:(NSString *)barcode {
    
    NSString *BaseUrlStr = @"https://api.upcitemdb.com/prod/trial/lookup?upc=";
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BaseUrlStr,barcode];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *data = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *erro = nil;
        
        if (data!=nil) {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&erro ];
            
            
            Modal *mobObj = [[Modal alloc]init];
            mobObj = [Modal parseJsonToResult:json];
            
            if ([mobObj.code isEqualToString:@"OK"]) {
                [self.delegate didReceiveData:mobObj];
            } else {
                [self.delegate didReceiveError:mobObj.message];
            }
            
            
        }
        
    }];
    
    [data resume];
    
}
@end
