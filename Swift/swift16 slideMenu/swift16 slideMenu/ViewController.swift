//
//  ViewController.swift
//  swift16 slideMenu
//
//  Created by Aaron on 16/7/18.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ZHViewController: UITableViewController, TransitionManagerDelegate {
let menuTransitionManager = TransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String("News")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")as!ViewCell
        cell.backgroundColor = UIColor.clearColor() 
        if indexPath.row == 0 {
            cell.bgView.image = UIImage(named: "1")
            cell.postTitle.text = "Love mountain."
            cell.postAuthor.text = "Allen Wang"
            cell.iconImg.image = UIImage(named: "a")
            
        } else if indexPath.row == 1 {
            cell.bgView.image = UIImage(named: "2")
            cell.postTitle.text = "New graphic design - LIVE FREE"
            cell.postAuthor.text = "Cole"
            cell.iconImg.image = UIImage(named: "b")
            
        } else if indexPath.row == 2 {
            cell.bgView.image = UIImage(named: "3")
            cell.postTitle.text = "Summer sand"
            cell.postAuthor.text = "Daniel Hooper"
            cell.iconImg.image = UIImage(named: "c")
            
        } else {
            cell.bgView.image = UIImage(named: "4")
            cell.postTitle.text = "Seeking for signal"
            cell.postAuthor.text = "Noby-Wan Kenobi"
            cell.iconImg.image = UIImage(named: "d")
            
        }
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let dest = segue.destinationViewController as! ZHMenuTVController
        dest.currentItem = title!
        dest.transitioningDelegate = menuTransitionManager
        menuTransitionManager.delegate = self
        
        
    }
    //ZHMenuTVController退出的时候执行的方法
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! ZHMenuTVController
        self.title = sourceController.currentItem
    }
    func dismiss(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}

