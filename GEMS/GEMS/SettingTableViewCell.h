//
//  SettingTableViewCell.h
//  GEMS
//
//  Created by Wee Kwan Tan on 14/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell
{
    UILabel *startDateInput;
    UILabel *endDateInput;
    UITextField *tagInput;
}
@property (nonatomic, strong) IBOutlet UILabel *startDateInput;
@property (nonatomic, strong) IBOutlet UILabel *endDateInput;
@property (nonatomic, strong) IBOutlet UITextField *tagInput;

@end
