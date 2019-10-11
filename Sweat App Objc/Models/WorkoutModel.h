//
//  WorkoutModel.m
//  Sweat App Objc
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import "JSONModel.h"

@protocol TagsModel
@end
@protocol AttributeModel
@end
@protocol TrainerModel
@end


@interface TrainerModel : JSONModel
@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *code_name;
@property (nonatomic) NSString *image_url;
@end

@interface WorkOutModel : JSONModel
@property (strong,nonatomic) NSNumber *id;
@property (strong,nonatomic) NSString *code_name;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *image;
@property (nonatomic) TrainerModel *trainer;
@property (nonatomic) NSArray <TagsModel> *tags;
@property (nonatomic) NSArray <AttributeModel> *attributes;
@end

@interface AttributeModel : JSONModel
@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *code_name;
@property (nonatomic) NSString *value;
@property (nonatomic) NSString *total;
@end

@interface TagsModel : JSONModel
@property (nonatomic) NSNumber *id;
@property (nonatomic) NSString *name;
@end


