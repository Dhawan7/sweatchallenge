//
//  WorkoutTVC.h
//  Sweat App Objc
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorkoutModel.h"
#import <YLProgressBar.h>

@class DynamicCollectionView;

NS_ASSUME_NONNULL_BEGIN

@interface WorkoutTVC : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblTrainerName;
@property (weak, nonatomic) IBOutlet UIImageView *trainerImgView;
@property (weak, nonatomic) IBOutlet UICollectionView *tagsCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *lblAttrib1;
@property (weak, nonatomic) IBOutlet UILabel *lblAttrib2;
@property (weak, nonatomic) IBOutlet UILabel *lblAttrib3;
@property (weak, nonatomic) IBOutlet UILabel *lblAttrib4;
@property (weak, nonatomic) IBOutlet UILabel *lblAttrib5;

@property (weak, nonatomic) IBOutlet YLProgressBar *progressAttrib1;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressAttrib2;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressAttrib3;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressAttrib4;
@property (weak, nonatomic) IBOutlet YLProgressBar *progressAttrib5;

@property (nonatomic) NSArray<TagsModel> *tags;
@property (nonatomic) NSArray<AttributeModel> *attribs;
-(void)setAttribData;
@end

NS_ASSUME_NONNULL_END
