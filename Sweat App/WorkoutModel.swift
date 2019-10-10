//
//  WorkoutModel.swift
//  Sweat
//
//  Created by SachTech on 09/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

import Foundation

struct WorkoutModel {
    
    var id:Int
    var acronym:String
    var codeName:String
    var name:String
    var image:String
    var attributes:[AttributesModel] = []
    var trainer:TrainerModel = TrainerModel(dict: NSDictionary())
    var tags:[Tags] = []
    
    init(dict:NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.acronym = dict.value(forKey: "acronym") as? String ?? ""
        self.codeName = dict.value(forKey: "code_name") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.image = dict.value(forKey: "image") as? String ?? ""
        if let attribList = dict.value(forKey: "attributes") as? NSArray{
            for attrib in attribList{
                let attribItem = AttributesModel.init(dict: attrib as? NSDictionary ?? NSDictionary())
                self.attributes.append(attribItem)
            }
        }
        else{
            
        }
        if let trainerDict = dict.value(forKey: "trainer") as? NSDictionary{
            self.trainer = TrainerModel.init(dict: trainerDict)
        }
        else{
            
        }
        if let tagsList = dict.value(forKey: "tags") as? NSArray{
            for tag in tagsList{
                let tagItem = Tags.init(dict: tag as? NSDictionary ?? NSDictionary())
                self.tags.append(tagItem)
            }
        }
        else{
            
        }
    }
    
}

struct AttributesModel {
    var id:Int
    var codeName:String
    var name:String
    var value:String
    var total:String
    
    init(dict:NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.codeName = dict.value(forKey: "code_name") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.value = dict.value(forKey: "value") as? String ?? ""
        self.total = dict.value(forKey: "total") as? String ?? ""
    }
}

struct TrainerModel {
    var id:Int
    var name:String
    var codeName:String
    var imageUrl:String
    
    init(dict:NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.codeName = dict.value(forKey: "code_name") as? String ?? ""
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.imageUrl = dict.value(forKey: "image_url") as? String ?? ""
    }
}

struct Tags {
    var id:Int
    var name:String
    
    init(dict:NSDictionary) {
        self.id = dict.value(forKey: "id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
    }
}
