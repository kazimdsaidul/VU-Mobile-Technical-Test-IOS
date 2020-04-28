//
//  ItemCell.swift
//  VU-Mobile-Technical-Test-IOS
//
//  Created by Kazi Md. Saidul on 4/28/20.
//  Copyright © 2020 Kazi Md. Saidul. All rights reserved.
//

import UIKit
import SDWebImage


class ItemCell: UICollectionViewCell {

    @IBOutlet weak var uiImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(name: String)  {
        
        let fileUrl = URL(string: name)

        self.uiImageView.sd_setImage(with: fileUrl, placeholderImage: UIImage(named: "placeholder.png"))

    }

}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
