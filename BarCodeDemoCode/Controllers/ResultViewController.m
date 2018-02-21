//
//  ResultViewController.m
//  BarCode Demo
//
//  Created by shikha  on 15/02/18.
//  Copyright © 2018 Shikha Singla. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultTableViewCell.h"

@interface ResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Product Detail";
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"ResultTableViewCell";
    ResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[ResultTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
      cell.backgroundColor = [UIColor greenColor];
        cell.labelTitle.text = [NSString stringWithFormat:@"Title: %@",self.ResultModal.title];
        cell.labelBrand.text = [NSString stringWithFormat:@"Brand: %@",self.ResultModal.brand];
        cell.labelEan.text = [NSString stringWithFormat:@"EAN: %@",self.ResultModal.ean];
        cell.labelElid.text = [NSString stringWithFormat:@"Serial Number: %@",self.ResultModal.elid];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
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
