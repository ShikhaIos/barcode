//
//  ViewController.m
//  BarCode Demo
//
//  Created by Shikha Singla on 2/14/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "ViewController.h"
#import "Webservice.h"
#import "ResultViewController.h"
#import "WebServicesResultModal.h"

@interface ViewController () <SBSScanDelegate,WebservicesClassDelegate,UITextFieldDelegate>

@property (nonatomic, strong, nullable) SBSBarcodePicker *picker;

@property (strong, nonatomic) IBOutlet UIButton *buttonScanCode;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
#pragma mark - WebServiceClassDelegate

-(void) didReceiveData:(Modal *)values
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    ResultViewController *resultVC =
    [storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"
     ];
    
    if (values.items.count == 1) {
        WebServicesResultModal * modObj = [[WebServicesResultModal alloc]init];
        modObj = [WebServicesResultModal parseJsonToProduct:values.items[0]];
        resultVC.ResultModal = modObj;
        
        dispatch_sync(dispatch_get_main_queue(),^{
            [self.navigationController presentViewController:resultVC animated:true completion:nil];
        });
    }
    
    
}
-(void)didReceiveError:(NSString *)error {
    NSLog(@"didReceiveError: %@",error);
    
    dispatch_sync(dispatch_get_main_queue(),^{
        [self showAlert:@"Here is problem" withMessage:error];
    });
}


#pragma mark - ButtonActions

- (IBAction)btnManuallyEnterBarCodeScan_Action:(id)sender {
    if (self.textfldData.text.length == 0) {
        [self showAlert:@"Problem" withMessage:@"please enter some value"];
    } else {
        Webservice *obj = [[Webservice alloc]init];
        obj.delegate = self;
        [obj getData:self.textfldData.text];
        
    }
}

- (IBAction)btnSubmitAction:(id)sender {
    
    Webservice *obj = [[Webservice alloc]init];
    obj.delegate = self;
    [obj getData:self.textfldData.text];
    
}

- (IBAction)buttonScanCode_Action:(UIButton *)sender {
    
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
    // Initialize the barcode picker - make sure you set the app key above
    self.picker = [[SBSBarcodePicker alloc] initWithSettings:settings];
    // hidden, even if they have a front camera.
    [self.picker.overlayController setCameraSwitchVisibility:SBSCameraSwitchVisibilityOnTablet];
    // set the allowed interface orientations. The value UIInterfaceOrientationMaskAll is the
    // default and is only shown here for completeness.
    [self.picker setAllowedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    // Set the delegate to receive scan event callbacks
    self.picker.scanDelegate = self;
    // Open the camera and start scanning barcodes
    [self.picker startScanning];
    [self presentViewController:self.picker animated:YES completion:nil];
}


// NOTE :- SBSBarcodePicker

- (void)barcodePicker:(SBSBarcodePicker *)thePicker didScan:(SBSScanSession *)session {
    
    [session stopScanning];
    SBSCode *code = [session.newlyRecognizedCodes objectAtIndex:0];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *symbology = code.symbologyString;
        NSString *barcode = code.data;
        self.textfldData.text = barcode;
        [self dismissViewControllerAnimated:YES completion:nil];
        // UIAlertController
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Scanned %@", symbology] message:barcode preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil ];
        [alert  addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    });
    
}

-(void)showAlert:(NSString *)title withMessage:(NSString *)message {
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"Here is problem!"
                                                                        message: message
                                                                 preferredStyle: UIAlertControllerStyleAlert];
    
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                            style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
                                                               // [self dismissViewControllerAnimated:YES completion:nil];
                                                            }];
    
    //Add dismiss button to alert
    [controller addAction:dismissAction];
    
    [self presentViewController: controller animated: YES completion: nil];
    
}


#pragma mark - textfieldDelegateMethod

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    self.textfldData.resignFirstResponder;
    return true;
}

@end
