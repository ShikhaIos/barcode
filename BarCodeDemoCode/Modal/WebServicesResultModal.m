//
//  WebServicesResultModal.m
//  BarCode Demo
//
//  Created by shikha  on 15/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "WebServicesResultModal.h"

@implementation WebServicesResultModal
+(WebServicesResultModal *)parseJsonToProduct:(NSDictionary *)dictionary {
    
    WebServicesResultModal *obj = [[WebServicesResultModal alloc]init];
    obj.title = dictionary[@"title"];
    obj.brand = dictionary[@"brand"];
    obj.ean = dictionary[@"ean"];
    obj.elid = dictionary[@"elid"];
    return obj;
}
@end
