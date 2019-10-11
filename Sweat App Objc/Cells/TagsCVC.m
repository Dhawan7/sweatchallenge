//
//  TagsCVC.m
//  Sweat App Objc
//
//  Created by SachTech on 11/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import "TagsCVC.h"

@implementation TagsCVC

- (void)awakeFromNib{
    [super awakeFromNib];
    [_backView layer].cornerRadius = 6.0;
    [_backView layer].borderWidth = 0.7;
    [_backView layer].borderColor = UIColor.lightGrayColor.CGColor;
}
@end
