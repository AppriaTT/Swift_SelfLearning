//
//  ViewController.swift
//  swift13
//
//  Created by Aaron on 16/7/15.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource  {
    
    let tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others","Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others"  ]
    
    var tableV = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let tableView = UITableView(frame: view.bounds, style: .Grouped)
        self.view.addSubview(tableView)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableV = tableView
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableV.reloadData()
        
        for cell in tableV.visibleCells{
            let tvCell = cell as UITableViewCell
            tvCell.transform = CGAffineTransformMakeTranslation(0, tableV.bounds.size.height)
        }
        var index = 0;
        
        for cell in tableV.visibleCells{
            let tvCell = cell as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index++), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations:{ () -> Void in
                tvCell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    let redR = CGFloat( random() % 256) / 255.0
    let greedR = CGFloat( random() % 256) / 255.0
    let blueR = CGFloat( random() % 256) / 255.0
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        cell?.textLabel!.text = String( tableData[indexPath.row])
        cell?.backgroundColor = UIColor(red: redR, green: greedR, blue: blueR * CGFloat( indexPath.row ) / CGFloat ( tableData.count ), alpha: 0.8)
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.presentViewController(ViewController(), animated: true, completion: nil)
    }
}

