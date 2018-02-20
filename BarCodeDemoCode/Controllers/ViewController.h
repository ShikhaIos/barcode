//
//  ViewController.h
//  BarCode Demo
//
//  Created by Shikha Singla on 2/14/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>
#import "SWRevealViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIBarButtonItem *menuButton;
@property (weak, nonatomic) IBOutlet UITextField *textfldData;
@property(strong,nonatomic) NSString *strValue;


@end

