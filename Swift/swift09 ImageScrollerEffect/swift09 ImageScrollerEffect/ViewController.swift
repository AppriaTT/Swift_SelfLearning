//
//  ViewController.swift
//  swift09 ImageScrollerEffect
//
//  Created by Aaron on 16/7/13.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    var sV:UIScrollView!
    var img:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgBG = UIImageView(image: UIImage(named: "steve"))
        imgBG.frame = self.view.bounds
        self.view.addSubview(imgBG)
        
        let visualView = UIVisualEffectView(frame: self.view.bounds)
        visualView.effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        self.view.addSubview(visualView)
        
        sV = UIScrollView(frame: self.view.bounds)
        sV.delegate = self
        self.view.addSubview(sV)
        
        img = UIImageView(image: UIImage(named: "steve"))
        img.frame.size = CGSizeMake(UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width/img.frame.size.width * img.frame.size.height)
        sV.addSubview(img)
//        img.center = sV.center
        
        img.userInteractionEnabled = true
        sV.minimumZoomScale = 1
        sV.maximumZoomScale = 10
        recenterImage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    private func recenterImage() {
        //重新中心化图片 使它固定在中间
        let scrollViewSize = sV.bounds.size
        let imageViewSize = img.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 : 0
        sV.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?{
        return img
    }
}

