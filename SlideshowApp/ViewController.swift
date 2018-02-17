//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 後達哉 on 2018/02/15.
//  Copyright © 2018年 Ta2ya1228. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var displayImageNo = 0
   


    func displayImage(){
      
        let imageNameArray = ["swift_photo.png",
                              "apple_photo.png",
                              "tamanegi_photo.jpg"]
        
        
        if displayImageNo == -1 {
            displayImageNo = 2
        }
        if displayImageNo == 3 {
            displayImageNo = 0
        }

        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)

        imageView.image = image
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    

override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func saisei(timer: Timer){
        displayImageNo += 1
        displayImage()
    }
    
    
    @IBOutlet weak var auto_Button: UIButton!
    
   
    
    @IBAction func auto_Button(_ sender: Any) {
        if timer == nil {timer = Timer.scheduledTimer(timeInterval:2.0, target:self, selector: #selector(saisei), userInfo:nil, repeats:true )
             auto_Button.setTitle("停止", for: .normal)
            
            susumu.isEnabled = false
            modoru.isEnabled = false
        }
        else{
            timer.invalidate()
            timer = nil
             auto_Button.setTitle("再生", for: .normal)
            susumu.isEnabled = true
            modoru.isEnabled = true
        }
        
    
    }
    
    @IBAction func modoru(_ sender: Any) {
   
        displayImageNo -= 1
        displayImage()

        }



    @IBAction func susumu(_ sender: Any) {
        
            displayImageNo += 1
            displayImage()
        }

    
    
//画面遷移
    override func prepare(for segue:UIStoryboardSegue , sender: Any?){
        let zoomVC = segue.destination as! ZoomViewController
        
        zoomVC.displayImageNo2 = displayImageNo
        if timer != nil{
            timer.invalidate()
            timer = nil
        }
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        print(displayImageNo)
        

    }
    


    @IBAction func unwind(_ segue: UIStoryboardSegue){
        timer = Timer.scheduledTimer(timeInterval:2.0, target:self, selector: #selector(saisei), userInfo:nil, repeats:true )
        
    }
    
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var susumu: UIButton!
    
    
}
