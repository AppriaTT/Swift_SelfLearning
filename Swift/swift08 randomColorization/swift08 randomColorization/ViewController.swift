//
//  ViewController.swift
//  swift08 randomColorization
//
//  Created by Aaron on 16/7/12.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    let gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    var timer : NSTimer?
    
    @IBAction func musicBtnClicked(sender: AnyObject) {
      let bgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
        //尝试是否这些能够运行
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOfURL: bgMusic)
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        if (timer == nil) {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "randomC", userInfo: nil, repeats: true)
        }
        
        self.view.backgroundColor = UIColor(red: CGFloat(random()%256)/255.0, green: CGFloat(random()%256)/255.0, blue: CGFloat(random()%256)/255.0, alpha: 0.8)
        
        gradientLayer.frame = self.view.bounds
        let color1 = UIColor(white: 0.36, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.26).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0.67, alpha: 0.58).CGColor as CGColorRef
        let color4 = UIColor(red: 0.26, green: 0.24, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.26, alpha: 0.2).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
    }
    func randomC(){
        self.view.backgroundColor = UIColor(red: CGFloat(random()%256)/255.0, green: CGFloat(random()%256)/255.0, blue: CGFloat(random()%256)/255.0, alpha: 0.8)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

