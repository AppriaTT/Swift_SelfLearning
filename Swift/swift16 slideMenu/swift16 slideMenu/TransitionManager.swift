//
//  TransitionManager.swift
//  swift16 slideMenu
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
@objc protocol TransitionManagerDelegate {
    
    func dismiss()
    
}

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    var duration = 0.5
    var isPresenting = false
    
    var snapshot:UIView?{
        didSet{
            if let _delegate = delegate{
                let tap = UITapGestureRecognizer(target: _delegate, action: "dismiss")
                snapshot?.addGestureRecognizer(tap)
            }
        }
    }
    
    var delegate:TransitionManagerDelegate?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval{
         return duration
    }
    //必须要实现的方法
    func animateTransition(transitionContext: UIViewControllerContextTransitioning){
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let container = transitionContext.containerView()
        let moveDown = CGAffineTransformMakeTranslation(0, container!.frame.height - 150)
        let moveUp = CGAffineTransformMakeTranslation(0, -50)
        
        if isPresenting {//正在展示的时候
            toView.transform = moveUp
            snapshot = fromView.snapshotViewAfterScreenUpdates(false)
            
            //添加的顺序问题
            container!.addSubview(toView)
            container!.addSubview(snapshot!)
            
        }
        
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: { () -> Void in
            if self.isPresenting {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransformIdentity
            }else{
                self.snapshot?.transform = CGAffineTransformIdentity
                fromView.transform = moveUp
            }
            
            }) { (Bool) -> Void in
            
                transitionContext.completeTransition(true)
                if !self.isPresenting {
                    self.snapshot?.removeFromSuperview()
                }
        }
        
    }
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        return self
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        return self
    }
}
