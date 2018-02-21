//
//  AppDelegate.h
//  BarCode Demo
//
//  Created by Shikha Singla on 2/14/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

@property(strong,nonatomic) NSString *scannedValue;
- (void)saveContext;


@end

