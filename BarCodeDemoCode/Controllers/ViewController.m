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
#import "SliderViewController.h"

@interface ViewController () <SBSScanDelegate,WebservicesClassDelegate,UITextFieldDelegate,SWRevealViewControllerDelegate>
@property (nonatomic, strong, nullable) SBSBarcodePicker *picker;
@end

@implementation ViewController
#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showMainMenu:)
                                                 name:@"CaptureComplete" object:nil];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.menuButton setTarget: self.revealViewController];
        [self.menuButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

// the function specified in the same class where we defined the addObserver
- (void)showMainMenu:(NSNotification *)note {
    NSLog(@"Received Notification");
    NSString *value = note.object;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.textfldData.text = value;
    });
}

-(void) didReceiveValue:(NSString *)value
{
    _strValue = value;
}
-(void) viewWillAppear:(BOOL)animated
{
    //    dispatch_async(dispatch_get_main_queue(), ^{
    //       self.textfldData.text = _strValue;
    //    });
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
    [storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
    if (values.items.count == 1) {
        WebServicesResultModal * modObj = [[WebServicesResultModal alloc]init];
        modObj = [WebServicesResultModal parseJsonToProduct:values.items[0]];
        dispatch_sync(dispatch_get_main_queue(),^{
            resultVC.ResultModal = modObj;
            [self.navigationController pushViewController:resultVC animated:true];
            //[self.navigationController presentViewController:resultVC animated:true completion:nil];
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
- (IBAction)btnSubmitAction:(id)sender {
    [self.view endEditing:YES];
    if (self.textfldData.text.length == 0) {
        [self showAlert:@"Problem" withMessage:@"please enter some value"];
    } else {
        Webservice *obj = [[Webservice alloc]init];
        obj.delegate = self;
        [obj getData:self.textfldData.text];
    }
}


-(void)showAlert:(NSString *)title withMessage:(NSString *)message {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle: @"Here is problem!"
                                                                        message: message
                                                                 preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss"
                                                            style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
                                                                self.textfldData.text = @ "";
                                                                
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

