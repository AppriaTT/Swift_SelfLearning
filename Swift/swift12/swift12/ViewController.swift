//
//  ViewController.swift
//  swift12
//
//  Created by Aaron on 16/7/14.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var centerCsFirst: NSLayoutConstraint!
    @IBOutlet weak var centerCsSec: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        loginBtn.alpha = 0
        centerCsFirst.constant -= self.view.bounds.width
        centerCsSec.constant   -= self.view.bounds.width
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animateWithDuration(0.5) { () -> Void in
            self.centerCsFirst.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }
        UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseInOut, animations: { () -> Void in
            self.centerCsSec.constant   += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseInOut, animations: { () -> Void in
            self.loginBtn.alpha = 1
            
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnClicked(sender: AnyObject) {
        let bounds = self.loginBtn.bounds
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .CurveLinear, animations: { () -> Void in
            self.loginBtn.bounds = CGRectMake(bounds.origin.x - 20, bounds.origin.y, bounds.size.width + 20,bounds.size.height)
            
            },completion: {finished in
                UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
                    self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width , height: bounds.size.height)
                    },completion: nil)
        })
        
    }
    @IBAction func backBtnClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
}

