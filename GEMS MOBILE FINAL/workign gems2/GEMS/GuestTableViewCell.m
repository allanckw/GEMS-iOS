//
//  GuestTableViewCell.m
//  GEMS
//
//  Created by Wee Kwan Tan on 17/10/12.
//  Copyright (c) 2012 Wee Kwan Tan. All rights reserved.
//

#import "GuestTableViewCell.h"

@implementation GuestTableViewCell

@synthesize guestNameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
