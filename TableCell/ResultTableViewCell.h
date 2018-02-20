//
//  ResultTableViewCell.h
//  BarCodeDemoCode
//
//  Created by shikha  on 20/02/18.
//  Copyright © 2018 shikha . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelElid;
@property (weak, nonatomic) IBOutlet UILabel *labelEan;
@property (weak, nonatomic) IBOutlet UILabel *labelBrand;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@end
