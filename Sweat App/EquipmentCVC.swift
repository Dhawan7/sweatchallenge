//
//  EquipmentCVC.swift
//  Sweat
//
//  Created by SachTech on 09/10/19.
//  Copyright © 2019 SachTech. All rights reserved.
//

import UIKit

class EquipmentCVC: UICollectionViewCell {
    
    @IBOutlet weak var lblEquipmentName: UILabel!
}

class TypeTVC:UITableViewCell{
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var progressVieew: UIProgressView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
class DynmicHeightCollectionView: UICollectionView {
  
  var isDynamicSizeRequired = false
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
      
      if self.intrinsicContentSize.height > frame.size.height {
        self.invalidateIntrinsicContentSize()
      }
      if isDynamicSizeRequired {
        self.invalidateIntrinsicContentSize()
      }
    }
  }
  
  override var intrinsicContentSize: CGSize {
    return contentSize
  }
}
