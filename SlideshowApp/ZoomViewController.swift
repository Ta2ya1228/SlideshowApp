//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 後達哉 on 2018/02/16.
//  Copyright © 2018年 Ta2ya1228. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    var displayImageNo2:Int = 0
    
    
    func displayImage(){
        
        let imageNameArray = ["swift_photo.png",
                              "apple_photo.png",
                              "tamanegi_photo.jpg"]
        
        
        
        let name = imageNameArray[displayImageNo2]
        
        let image = UIImage(named: name)
        
        imageView2.image = image
    }
    
    
    
    @IBOutlet weak var imageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      displayImage()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
