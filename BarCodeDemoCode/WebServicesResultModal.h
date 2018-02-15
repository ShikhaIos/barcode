//
//  WebServicesResultModal.h
//  BarCode Demo
//
//  Created by shikha  on 15/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServicesResultModal : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *brand;
@property (nonatomic, copy) NSString *ean;
@property (nonatomic, copy) NSString *elid;


+(WebServicesResultModal *)parseJsonToProduct:(NSDictionary *)dictionary;
@end
