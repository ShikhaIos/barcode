//
//  Modal.m
//  BarCode Demo
//
//  Created by shikha  on 14/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "Modal.h"

@implementation Modal

+(Modal *)parseJsonToResult:(NSDictionary *)dictionary {
    
    Modal *modObj = [[Modal alloc]init];
    modObj.code = dictionary[@"code"];
    modObj.message = dictionary[@"message"];
    modObj.items = dictionary[@"items"];
    return modObj;
}
@end
