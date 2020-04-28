//
//  ItemCell.swift
//  VU-Mobile-Technical-Test-IOS
//
//  Created by Kazi Md. Saidul on 4/28/20.
//  Copyright © 2020 Kazi Md. Saidul. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var uiImageView: UIImageView!
    @IBOutlet weak var uiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setData(name: String)  {
        self.uiLabel.text = name
    }

}
