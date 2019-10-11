//
//  WorkoutTVC.m
//  Sweat App Objc
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import "WorkoutTVC.h"
#import "TagsCVC.h"

@implementation WorkoutTVC



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _tagsCollectionView.delegate = self;
    _tagsCollectionView.dataSource = self;
    [_backView layer].cornerRadius = 6.0;
    [_backView layer].shadowColor = [UIColor colorNamed:@"appGray"].CGColor;//UIColor.lightGrayColor.CGColor;
    [_backView layer].shadowOffset = CGSizeMake(0.8, 0.8);
    [_backView layer].shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setAttribData{
    
    AttributeModel * attrib1 = _attribs[0];
    AttributeModel * attrib2 = _attribs[1];
    AttributeModel * attrib3 = _attribs[2];
    AttributeModel * attrib4 = _attribs[3];
    AttributeModel * attrib5 = _attribs[4];
    
    [_progressAttrib1 layer].cornerRadius = 5.0;
    [_progressAttrib2 layer].cornerRadius = 5.0;
    [_progressAttrib3 layer].cornerRadius = 5.0;
    [_progressAttrib4 layer].cornerRadius = 5.0;
    [_progressAttrib5 layer].cornerRadius = 5.0;
    
    [_progressAttrib1 layer].borderColor = [UIColor colorNamed:@"appGray"].CGColor;
    [_progressAttrib2 layer].borderColor = [UIColor colorNamed:@"appGray"].CGColor;
    [_progressAttrib3 layer].borderColor = [UIColor colorNamed:@"appGray"].CGColor;
    [_progressAttrib4 layer].borderColor = [UIColor colorNamed:@"appGray"].CGColor;
    [_progressAttrib5 layer].borderColor = [UIColor colorNamed:@"appGray"].CGColor;
    
    [_progressAttrib1 layer].borderWidth = 1.0;
    [_progressAttrib2 layer].borderWidth = 1.0;
    [_progressAttrib3 layer].borderWidth = 1.0;
    [_progressAttrib4 layer].borderWidth = 1.0;
    [_progressAttrib5 layer].borderWidth = 1.0;
    
    [_lblAttrib1 setText:[attrib1 name]];
    [_lblAttrib2 setText:[attrib2 name]];
    [_lblAttrib3 setText:[attrib3 name]];
    [_lblAttrib4 setText:[attrib4 name]];
    [_lblAttrib5 setText:[attrib5 name]];
    
    [_progressAttrib1 setProgress:[attrib1.value floatValue] / [attrib1.total floatValue]];
    [_progressAttrib2 setProgress:[attrib2.value floatValue] / [attrib2.total floatValue]];
    [_progressAttrib3 setProgress:[attrib3.value floatValue] / [attrib3.total floatValue]];
    [_progressAttrib4 setProgress:[attrib4.value floatValue] / [attrib4.total floatValue]];
    [_progressAttrib5 setProgress:[attrib5.value floatValue] / [attrib5.total floatValue]];
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    TagsCVC * tagCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tagCell" forIndexPath:indexPath];
    [[tagCell labelTagNAme] setText:[_tags[indexPath.row] name]];
    return tagCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_tags.count > 0){
        return _tags.count;
    }
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UILabel *label = [[UILabel alloc]init];
    [label setFont: [UIFont systemFontOfSize:17.0]];
    [label setText:[_tags[indexPath.row] name]];
    [label sizeToFit];
    return CGSizeMake(label.frame.size.width + 8, label.frame.size.height + 8);
}

@end
