//
//  ViewController.m
//  Sweat App Objc
//
//  Created by SachTech on 10/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

#import "ViewController.h"
#import "WorkoutModel.h"
#import "WorkoutTVC.h"
#import <SDWebImage/SDWebImage.h>
#import <JSONModel/JSONModel.h>

@interface ViewController ()

@end

@implementation ViewController

NSMutableArray<WorkOutModel *> *modelList;

- (void)viewDidLoad {
    [super viewDidLoad];
    modelList = [[NSMutableArray alloc] init];
    [self parseJson];
    // Do any additional setup after loading the view.
}

- (void)parseJson {
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"trainer-programs" ofType:@"json"];
    if (jsonPath != NULL){
        @try {
            NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
            //NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:NULL];
            modelList = [WorkOutModel arrayOfModelsFromData:jsonData error:nil];
            [_tableView reloadData];
        } @catch (NSException *exception) {
            NSLog(@"%@", [exception reason]);
        } @finally {

        }
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WorkoutTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"workoutCell"];
    //TagsModel *tags = [modelList[indexPath.row] tags];
    //AttributeModel * attrib = [modelList[indexPath.row] attributes];
    TrainerModel * trainer = [modelList[indexPath.row] trainer];
    cell.tags = [modelList[indexPath.row] tags];
    cell.attribs = [modelList[indexPath.row] attributes];
    [cell setAttribData];
    [[cell lblName] setText:[modelList[indexPath.row] name]];
    [[cell trainerImgView]sd_setImageWithURL:[NSURL URLWithString: trainer.image_url]];
    [[cell lblTrainerName] setText:[@"with " stringByAppendingString:trainer.name]];
    [cell layoutIfNeeded];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return modelList.count;
}

@end
