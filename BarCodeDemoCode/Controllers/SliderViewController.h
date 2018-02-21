//
//  SliderViewController.h
//  BarCodeDemoCode
//
//  Created by shikha  on 19/02/18.
//  Copyright © 2018 shikha . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@protocol ViewControllerClassDelegate
- (void)didReceiveValue:(NSString *)value;

@end

@interface SliderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableVw;
@property (nonatomic, weak) id <ViewControllerClassDelegate> delegate;
@property(strong,nonatomic) NSString *strValuetoPass;
@end
