//
//  Webservice.h
//  BarCode Demo
//
//  Created by shikha  on 14/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Modal.h"

@protocol WebservicesClassDelegate

- (void)didReceiveData:(Modal *)values;
- (void)didReceiveError:(NSString *)error;

@end

@interface Webservice : NSObject
@property (nonatomic, weak) id <WebservicesClassDelegate> delegate;

-(void)getData:(NSString *)barcode;

@end
