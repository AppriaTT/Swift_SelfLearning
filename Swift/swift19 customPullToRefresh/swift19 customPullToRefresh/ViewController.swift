//
//  ViewController.swift
//  swift19 customPullToRefresh
//
//  Created by Aaron on 16/7/22.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource  = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆", "😆😆😆😆😆", "😆😆😆😆😆"]
    var freshControl : UIRefreshControl!
    var customView : UIView!
    var labelArray : Array<UILabel> = []
    var isAnimating =  false
    var timer : NSTimer!
    var currentColorIndex = 0
    var currentLabelIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        freshControl = UIRefreshControl()
        tableView.addSubview(freshControl)
        freshControl.backgroundColor = UIColor.clearColor()
        freshControl.tintColor = UIColor.clearColor()
        //加载自定义的刷新视图
        loadCustomRefreshContents()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadCustomRefreshContents(){
        let refreshC = NSBundle.mainBundle().loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshC.first as! UIView
        customView.frame = freshControl.bounds
        for var i = 0; i < customView.subviews.count;++i{
            
            labelArray.append(customView.viewWithTag(i + 1) as! UILabel)
        
        }
        
        freshControl.addSubview(customView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("swift19Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = dataSource[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Apple Color Emoji", size: 40)
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if freshControl.refreshing{
            if !isAnimating {
                timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "endedWork", userInfo: nil, repeats: true)
                
                animateRefreshStep1()
            }
        }
    }
    
    func animateRefreshStep1(){
        
        isAnimating = true
        
        UIView.animateWithDuration(0.1, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
            self.labelArray[self.currentLabelIndex].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            self.labelArray[self.currentLabelIndex].textColor = self.getNextColor()
            
            }) { (finished) -> Void in
                
                UIView.animateWithDuration(0.05, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                    self.labelArray[self.currentLabelIndex].transform = CGAffineTransformIdentity
                    self.labelArray[self.currentLabelIndex].textColor = UIColor.blackColor()
                    
                    }, completion: { (finished) -> Void in
                        ++self.currentLabelIndex
                        
                        if self.currentLabelIndex < self.labelArray.count {
                            self.animateRefreshStep1()
                        }
                        else {
                            self.animateRefreshStep2()
                        }
                })
                
        }
        
    }
    
    func animateRefreshStep2(){
        UIView.animateWithDuration(0.4, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
            for var i = 0; i < self.labelArray.count;++i{
                
               self.labelArray[i].transform = CGAffineTransformMakeScale(1.5, 1.5)
                
            }
            
            }) { (finished) -> Void in
             UIView.animateWithDuration(0.25, delay: 0.0, options: .CurveLinear, animations: { () -> Void in
                for var i = 0; i < self.labelArray.count;++i{
                    
                    self.labelArray[i].transform = CGAffineTransformIdentity
                    
                }
                
                }, completion: { (finished) -> Void in
                    if self.freshControl.refreshing {
                        self.currentLabelIndex = 0
                        self.animateRefreshStep1()
                    }else{
                        self.isAnimating = false
                        self.currentLabelIndex = 0
                        for var i  = 0; i < self.labelArray.count; ++i {
                            self.labelArray[i].textColor = UIColor.blackColor()
                            self.labelArray[i].transform = CGAffineTransformIdentity
                        }
                    }
             })
                
        }
        
    }
    func getNextColor()->UIColor {
        var colorsArray: Array<UIColor> = [UIColor.magentaColor(), UIColor.brownColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.orangeColor()]
        
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        
        let returnColor = colorsArray[currentColorIndex]
        ++currentColorIndex
        
        return returnColor

        
        
    }
    func endedWork() {
        
        freshControl.endRefreshing()
        timer!.invalidate()
        timer = nil
    }
}

