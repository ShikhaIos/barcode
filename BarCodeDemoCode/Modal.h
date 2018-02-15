//
//  Modal.h
//  BarCode Demo
//
//  Created by shikha  on 14/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Modal : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray  *items;


+(Modal *)parseJsonToResult:(NSDictionary *)dictionary;
@end
