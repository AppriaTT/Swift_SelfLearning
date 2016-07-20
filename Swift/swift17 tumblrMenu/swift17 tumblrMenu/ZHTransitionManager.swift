//
//  ZHTransitionManager.swift
//  swift17 tumblrMenu
//
//  Created by Aaron on 16/7/20.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ZHTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    private var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.5
    }
    //必须要实现的方法, 跳转时 会执行的方法
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        
        let container = transitionContext.containerView()
        let screens :(from:UIViewController,to:UIViewController) = (transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!,transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!)
        let menuViewC = !self.presenting ? screens.from as! ZHMenuViewController : screens.to as! ZHMenuViewController
        let bottomVC = !self.presenting ? screens.to as UIViewController : screens.from as UIViewController
        
        let menuView = menuViewC.view
        let bottomView = bottomVC.view
        if presenting {
           off(menuViewC)
        }
        
        container!.addSubview(bottomView)
        container!.addSubview(menuView)
        let duration = self.transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, delay:0.0 , usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            if self.presenting{
                self.on(menuViewC)
            }else{
                self.off(menuViewC)
            }
            
            }) { (Bool) -> Void in
                transitionContext.completeTransition(true)
                UIApplication.sharedApplication().keyWindow!.addSubview(screens.to.view)
        }
        
    }
    func offstage(amount:CGFloat)->CGAffineTransform{
        return CGAffineTransformMakeTranslation(amount, 0)
    }
    
    func off(menuVC:ZHMenuViewController){
        if !presenting{
            menuVC.view.alpha = 0
        }
        
        
        let topRowOffset  : CGFloat = 300
        let middleRowOffset : CGFloat = 150
        let bottomRowOffset  : CGFloat = 50
        
        menuVC.textButton.transform = self.offstage(-topRowOffset)
        menuVC.textLabel.transform = self.offstage(-topRowOffset)
        
        menuVC.quoteButton.transform = self.offstage(-middleRowOffset)
        menuVC.quoteLabel.transform = self.offstage(-middleRowOffset)
        
        menuVC.chatButton.transform = self.offstage(-bottomRowOffset)
        menuVC.chatLabel.transform = self.offstage(-bottomRowOffset)
        
        menuVC.photoButton.transform = self.offstage(topRowOffset)
        menuVC.photoLabel.transform = self.offstage(topRowOffset)
        
        menuVC.linkButton.transform = self.offstage(middleRowOffset)
        menuVC.linkLabel.transform = self.offstage(middleRowOffset)
        
        menuVC.audioButton.transform = self.offstage(bottomRowOffset)
        menuVC.audioLabel.transform = self.offstage(bottomRowOffset)

    }
    
    func on(menuVC:ZHMenuViewController){
        menuVC.view.alpha = 1
        
        menuVC.textButton.transform = CGAffineTransformIdentity
        menuVC.textLabel.transform = CGAffineTransformIdentity
        menuVC.quoteButton.transform = CGAffineTransformIdentity
        menuVC.quoteLabel.transform = CGAffineTransformIdentity
        menuVC.chatButton.transform = CGAffineTransformIdentity
        menuVC.chatLabel.transform = CGAffineTransformIdentity
        menuVC.photoButton.transform = CGAffineTransformIdentity
        menuVC.photoLabel.transform = CGAffineTransformIdentity
        menuVC.linkButton.transform = CGAffineTransformIdentity
        menuVC.linkLabel.transform = CGAffineTransformIdentity
        menuVC.audioButton.transform = CGAffineTransformIdentity
        menuVC.audioLabel.transform = CGAffineTransformIdentity

    }
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = true
        return self
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.presenting = false
        return self
    }
}
