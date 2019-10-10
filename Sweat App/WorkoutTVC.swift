//
//  WorkoutTVC.swift
//  Sweat
//
//  Created by SachTech on 09/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

import UIKit
import YLProgressBar

class WorkoutTVC: UITableViewCell {

    @IBOutlet weak var backView: UIViewX!
    @IBOutlet weak var lblWorkoutName: UILabel!
    @IBOutlet weak var lblTrainerName: UILabel!
    @IBOutlet weak var workoutTypeTableView: UITableView!
    @IBOutlet weak var equipmentCollection: DynmicHeightCollectionView!
    @IBOutlet weak var trainerImgView: UIImageView!
    @IBOutlet weak var tableConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var lblType1: UILabel!
    @IBOutlet weak var lblType2: UILabel!
    @IBOutlet weak var lblType3: UILabel!
    @IBOutlet weak var lblType4: UILabel!
    @IBOutlet weak var lblType5: UILabel!
    @IBOutlet weak var progress1: YLProgressBar!
    @IBOutlet weak var progress2: YLProgressBar!
    @IBOutlet weak var progress3: YLProgressBar!
    @IBOutlet weak var progress4: YLProgressBar!
    @IBOutlet weak var progress5: YLProgressBar!
    
    
    var workout:WorkoutModel! = WorkoutModel(dict: NSDictionary())
    var attributeList:[AttributesModel] = []
    var tags:[Tags] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //workoutTypeTableView.delegate = self
        //workoutTypeTableView.dataSource = self
        equipmentCollection.delegate = self
        equipmentCollection.dataSource = self
        // Initialization code
        progress1.layer.cornerRadius = 4.0
        progress2.layer.cornerRadius = 4.0
        progress3.layer.cornerRadius = 4.0
        progress4.layer.cornerRadius = 4.0
        progress5.layer.cornerRadius = 4.0
        progress1.layer.borderWidth = 1.0
        progress1.layer.borderColor = UIColor.lightGray.cgColor
        progress2.layer.borderWidth = 1.0
        progress2.layer.borderColor = UIColor.lightGray.cgColor
        progress3.layer.borderWidth = 1.0
        progress3.layer.borderColor = UIColor.lightGray.cgColor
        progress4.layer.borderWidth = 1.0
        progress4.layer.borderColor = UIColor.lightGray.cgColor
        progress5.layer.borderWidth = 1.0
        progress5.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    override func updateConstraints() {
//            tableConstraint.constant = workoutTypeTableView.contentSize.height
//            super.updateConstraints()
//    }
    
    func setAtttribData(_ attrb:[AttributesModel]){
        if attrb.count == 5{
        lblType1.text = attrb[0].name
        lblType2.text = attrb[1].name
        lblType3.text = attrb[2].name
        lblType4.text = attrb[3].name
        lblType5.text = attrb[4].name
        progress1.progress = CGFloat((Float(attrb[0].value) ?? 0)) / CGFloat((Float(attrb[0].total) ?? 1))
        progress2.progress = CGFloat((Float(attrb[1].value) ?? 0)) / CGFloat((Float(attrb[1].total) ?? 1))
        progress3.progress = CGFloat((Float(attrb[2].value) ?? 0)) / CGFloat((Float(attrb[2].total) ?? 1))
        progress4.progress = CGFloat((Float(attrb[3].value) ?? 0)) / CGFloat((Float(attrb[3].total) ?? 1))
        progress5.progress = CGFloat((Float(attrb[4].value) ?? 0)) / CGFloat((Float(attrb[4].total) ?? 1))
        }
    }
}
extension WorkoutTVC:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attribCell") as! TypeTVC
        let attrib = attributeList[indexPath.row]
        cell.lblType.text = attrib.name
        //cell.progressVieew.layer.cornerRadius = 2.0
        //cell.progressVieew.transform = CGAffineTransform.init(scaleX: 1.0, y: 3.0)
        cell.progressVieew.progress = (Float(attrib.value) ?? 0) / (Float(attrib.total) ?? 1)
        return cell
    }
    
}

extension WorkoutTVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "equipmentCell", for: indexPath) as! EquipmentCVC
        cell.lblEquipmentName.text = tags[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = tags[indexPath.row].name
        label.sizeToFit()
        return CGSize(width: label.frame.width + 5, height: label.frame.height + 8)
    }
    
}
