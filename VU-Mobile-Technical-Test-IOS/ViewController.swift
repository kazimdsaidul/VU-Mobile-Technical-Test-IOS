//
//  ViewController.swift
//  VU-Mobile-Technical-Test-IOS
//
//  Created by Kazi Md. Saidul on 4/28/20.
//  Copyright © 2020 Kazi Md. Saidul. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var isDataLoading = false
    var pageCount:Int = 1 // Pass this page number in your api
    
    var data1 = [String]()
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Register cells
        self.collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        // SetupGrid view
        self.setupGridView()
        
        DATA(pageCount: pageCount)
        
        
    }
    
    func DATA(pageCount: Int) {
        
        isDataLoading = true
        
        let stringURL = "https://reqres.in/api/users?page=\(pageCount)"
        
        let  Url = URL(string: stringURL)
        Alamofire.request(Url!).validate().responseJSON { (response) in
            if ((response.result.value) != nil) {
                
                let jsondata = JSON(response.result.value!)
                print(jsondata)
                if let da = jsondata["data"].arrayObject
                {
                
                    for obj in da {
                        if let dict = obj as? NSDictionary {
                            // Now reference the data you need using:
                            let avatar = dict.value(forKey: "avatar")
                            self.data1.append(avatar as! String)
                        }
                    }
                    
                }
                if self.data1.count > 0 {
                    self.collectionView?.reloadData()
                    self.pageCount = self.pageCount+1
                }else{
                   self.pageCount = self.pageCount-1
                    

                }
                
                self.isDataLoading = false
            }
        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(name: self.data1[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == data1.count - 1 ) { //it's your last cell
            //Load more data & reload your collection view
            DATA(pageCount: pageCount)
        }
    }
  
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    func calculateWith() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
    
}

