//
//  ResultViewController.m
//  BarCode Demo
//
//  Created by shikha  on 15/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.labelTitle.text = [NSString stringWithFormat:@"%@",self.ResultModal.title];
    self.labelBrand.text = [NSString stringWithFormat:@"Brand: %@",self.ResultModal.brand];
    self.labelEan.text = [NSString stringWithFormat:@"Serial Number: %@",self.ResultModal.elid];
    self.labelElid.text = [NSString stringWithFormat:@"EAN: %@",self.ResultModal.ean];
    
    // Do any additional setup after loading the view.
}
- (IBAction)backButtonPressed:(UIButton *)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    UINavigationController *VC =
    [storyboard instantiateViewControllerWithIdentifier:@"MainVC"];
    [self presentViewController:VC
                       animated:YES
                     completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
