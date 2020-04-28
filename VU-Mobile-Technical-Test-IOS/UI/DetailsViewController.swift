//
//  DetailsViewController.swift
//  VU-Mobile-Technical-Test-IOS
//
//  Created by Kazi Md. Saidul on 4/29/20.
//  Copyright © 2020 Kazi Md. Saidul. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var UiImageView: UIImageView!

    var url = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileUrl = URL(string: url)

        self.UiImageView.sd_setImage(with: fileUrl, placeholderImage: UIImage(named: "placeholder.png"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
