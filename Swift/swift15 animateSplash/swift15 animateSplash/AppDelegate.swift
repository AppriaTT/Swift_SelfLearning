//
//  AppDelegate.swift
//  swift15 animateSplash
//
//  Created by Aaron on 16/7/15.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mask: CALayer?
    var imageView:UIImageView?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = UIViewController()
        self.window?.makeKeyAndVisible()
        
        //充当底部内容简介 后期可以用tabbarController.view替换
        let imgView = UIImageView(image: UIImage(named: "screen"))
        imgView.frame = self.window!.bounds
        self.window?.addSubview(imgView)
        
        //中间充当mask的小鸟
        mask = CALayer()
        mask!.contents = UIImage(named: "twitter")?.CGImage
        mask?.contentsGravity = kCAGravityResizeAspect
        mask?.bounds = CGRectMake(0, 0, 100, 81)
        mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask?.position = CGPoint(x: imgView.frame.size.width / 2, y: imgView.frame.height / 2)
        imgView.layer.mask  = mask
        self.imageView = imgView
        
        self.animateMask()
        
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)

        
        // Override point for customization after application launch.
        return true
    }
    
    func animateMask(){
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAnimation.delegate = self
        keyFrameAnimation.duration = 0.6
        keyFrameAnimation.beginTime = CACurrentMediaTime() + 0.5
        keyFrameAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
        //三段动画 我的理解是为了展现小鸟震动的效果, 先缩小再放大至空白部分填满全屏
        let initalBounds = NSValue(CGRect: mask!.bounds)
        let secondBounds = NSValue(CGRect:CGRect(x: 0, y: 0, width: 90, height: 73))
        let finalBounds  = NSValue(CGRect:CGRect(x: 0, y: 0, width: 1600, height: 1300))
        
        keyFrameAnimation.values = [initalBounds,secondBounds,finalBounds]
        keyFrameAnimation.keyTimes = [0,0.3,1]
        self.mask?.addAnimation(keyFrameAnimation, forKey: "bounds")
        
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        //动画结束后取消遮罩
        self.imageView!.layer.mask = nil
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

