//
//  DynamicCollectionView.m
//  Sweat App Objc
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DynamicCollectionView : UICollectionView

@end

@implementation DynamicCollectionView

- (id<UICollectionViewDelegate>)delegate{
    return [super delegate];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize]))
    {
        [self invalidateIntrinsicContentSize];
    }
}

- (CGSize)intrinsicContentSize
{
    CGSize intrinsicContentSize = self.contentSize;
    
    return intrinsicContentSize;
}

@end


