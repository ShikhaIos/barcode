//
//  AppDelegate.m
//  BarCode Demo
//
//  Created by Shikha Singla on 2/14/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [SBSLicense setAppKey: @"Abe7Zi5QNXDyE4JCXh/SPEQSpMXbHxu7J3/JVhFq1vv5Y6dTi3slYT4vinVDfVTXdkRsmqofk1J8ceqdkl1kq8V2tLqzWPTuZR3L1FdHmnqAbVu15CEQ64w85WAb+fZ57MBarnMETbra/NFh+wOLUzAwl4b+BKp3P24TI/ifuwgFfMTELz1L0n9+wtnerudWm0DsYfIgz3ZdnDVtL3eZXUqav1EATwHopFBPMjbbkseJMAmILnfOLX8I38HlgmYXt2Q7tSy18K5/hgAXiTPEMrFLltgQ6GDlISugQb3/5xnJtwLZ7xpsIN8fsReqldeCxXiTtNv8vjMdsgMwJS4VMtlH/66xPTmjaJvaEpG5ds3wbfA4vDLjKtswyKQDjIfHrUQ9Lq/DJcj+181mTHlZGJAouv08JbyhYndEQ77spaxuHL/7tlIy3/c23++1DXZfZj1La+qscYFabqzMxFFQPfA9e1ReID/t5/O6KBnrA1+y7bwqVXHDyXUMYgj16MaWjSq7fbotTUY9bQbSU5+Oqdwmv3pMpSA6xfUybvbWG11RiRErqZ1l/Ki/idakQVpU71cHaAytyx6dP9nZT8RSdKWGeAehiIr5BrpkRIyV3dwVPi5Pmc8v8SnKFCAW7jW18kw9Iafy2WC87dXIKCqY+cltGobf5Qm+WI13C7axFGNpAJ+jAYDIwqR5/rMWSD2KP3MCuWjUdeB5Q7pxcCs2Isu8HWY9Objit/w3JxRlfpx5qLg3pJ7978gc8KZ3jhlF5N6uAh2XYJuTmm22r+O2LAPiMOpht8fICok="];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BarCode_Demo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
