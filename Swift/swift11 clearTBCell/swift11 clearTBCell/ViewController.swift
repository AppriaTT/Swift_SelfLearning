//
//  ViewController.swift
//  swift11 clearTBCell
//
//  Created by Aaron on 16/7/14.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        self.view.addSubview(tableView)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "tvCell")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tvCell")
        let green = CGFloat (indexPath.row) / CGFloat(tableData.count - 1) * 0.8;
        cell?.textLabel!.text = String( tableData[indexPath.row])
        cell?.backgroundColor = UIColor(red: 0.4, green: green, blue: 0.4, alpha: 0.5)
        
        // 添加白色边框
        let graLayer = CAGradientLayer()
        graLayer.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 60)
        
        let color1 = UIColor(white: 1.0, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(white: 1.0, alpha: 0.1).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.05).CGColor as CGColorRef
        
        graLayer.colors = [color1, color2, color3, color4]
        graLayer.locations = [0.0, 0.04, 0.95, 1.0]
        cell?.layer.addSublayer(graLayer)
        return cell!
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
}

