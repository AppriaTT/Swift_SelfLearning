//
//  ViewController.swift
//  swift10 videoBG
//
//  Created by Aaron on 16/7/13.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: ZHVideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url  = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        videoFrame = self.view.bounds
        alwaysRepeat = true
        startTime = 2.0
        contentURL = url
        
//        view.userInteractionEnabled = flase
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(animated: Bool){
        super.viewWillDisappear(animated)
        navigationController?.navigationBarHidden = false
    }

}

