//
//  SliderViewController.m
//  BarCodeDemoCode
//
//  Created by shikha  on 19/02/18.
//  Copyright © 2018 shikha . All rights reserved.
//

#import "SliderViewController.h"
#import "SliderTableViewCell.h"
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>
#import "AppDelegate.h"
@interface SliderViewController ()<UITableViewDelegate,UITableViewDataSource,SBSScanDelegate>
@property (nonatomic, strong, nullable) SBSBarcodePicker *picker;
@end

@implementation SliderViewController
{
    NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    tableData = [NSArray arrayWithObjects:@"ScanBarCode", @"EnterBarCode", nil];
    self.tableVw.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    
    // Do any additional setup after loading the view.
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSourceAndDelegate
-(void)viewDidLayoutSubviews
{
    if ([self.tableVw respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableVw setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableVw respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableVw setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SliderTableViewCell";
    
    SliderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[SliderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.labelData.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    if (row == 0)
    {
        SBSScanSettings* settings = [SBSScanSettings defaultSettings];
        NSSet *symbologiesToEnable = [NSSet setWithObjects:
                                      @(SBSSymbologyEAN13) ,
                                      @(SBSSymbologyUPC12),
                                      @(SBSSymbologyEAN8),
                                      @(SBSSymbologyUPCE),
                                      @(SBSSymbologyCode39) ,
                                      @(SBSSymbologyCode128),
                                      @(SBSSymbologyITF),
                                      @(SBSSymbologyQR),
                                      @(SBSSymbologyDatamatrix),
                                      @(SBSSymbologyPDF417),nil];
        [settings enableSymbologies:symbologiesToEnable];
        SBSSymbologySettings *symSettings = [settings settingsForSymbology:SBSSymbologyCode39];
        symSettings.activeSymbolCounts =
        [NSSet setWithObjects:@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, nil];
        self.picker = [[SBSBarcodePicker alloc] initWithSettings:settings];
        [self.picker.overlayController setCameraSwitchVisibility:SBSCameraSwitchVisibilityOnTablet];
        [self.picker setAllowedInterfaceOrientations:UIInterfaceOrientationMaskAll];
        self.picker.scanDelegate = self;
        [self.picker.overlayController showToolBar:YES];
        self.picker.overlayController.cancelDelegate = self;

        [self.picker startScanning];
        [self presentViewController:self.picker animated:YES completion:nil];
    }
    else
    {
        [self performSegueWithIdentifier:@"barcode" sender:self];
    }
}
#pragma mark - SBSBarCodeScannerDelegate

- (void)barcodePicker:(SBSBarcodePicker *)thePicker didScan:(SBSScanSession *)session {
    [session stopScanning];
    SBSCode *code = [session.newlyRecognizedCodes objectAtIndex:0];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *symbology = code.symbologyString;
        NSString *barcode = code.data;
        self.strValuetoPass = barcode;
        
        [self dismissViewControllerAnimated:YES completion:nil];
        // UIAlertController
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Scanned %@", symbology] message:barcode preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            
            AppDelegate *obj_appdelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
            obj_appdelegate.scannedValue = self.strValuetoPass;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"CaptureComplete" object:_strValuetoPass];
            
            //[self.delegate didReceiveValue:_strValuetoPass];
            [self.revealViewController revealToggleAnimated:YES];
            
        }];
        [alert  addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    });
    
}
- (void) overlayController:(nonnull SBSOverlayController *)overlayController didCancelWithStatus:(nullable NSDictionary *)status
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

