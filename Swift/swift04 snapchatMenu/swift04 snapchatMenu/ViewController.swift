//
//  ViewController.swift
//  swift04 snapchatMenu
//
//  Created by Aaron on 16/7/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let leftView = UIImageView(image: UIImage(named: "left"))
        let rightView = UIImageView(image: UIImage(named: "right"))
        let centerView = ZHCameroView.init(frame: self.view.bounds)
        
        let sv = UIScrollView(frame: CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))
        sv.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height)
        sv.addSubview(leftView)
        sv.addSubview(rightView)
        sv.addSubview(centerView)
        self.view.addSubview(sv)
        
        sv.pagingEnabled = true
        //设置frame
        leftView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        centerView.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)
        rightView.frame = CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

