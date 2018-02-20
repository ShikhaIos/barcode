//
//  ResultViewController.h
//  BarCode Demo
//
//  Created by shikha  on 15/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServicesResultModal.h"

@interface ResultViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) WebServicesResultModal * ResultModal;
@end
