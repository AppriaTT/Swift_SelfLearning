//
//  ViewController.swift
//  swift07 pullToRefresh
//
//  Created by Aaron on 16/7/11.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableViewC = UITableViewController(style: UITableViewStyle.Plain)
    var dataSource = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(tableViewC)
        let tableView = tableViewC.tableView
        tableView.frame = self.view.bounds
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = UIColor.whiteColor()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.registerClass(UITableViewCell().classForCoder, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
        let refresh = UIRefreshControl()
        refresh.backgroundColor = UIColor.whiteColor()
        refresh.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        tableViewC.refreshControl = refresh
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataSource.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel!.text = dataSource[indexPath.row]
        
        let f = Float(random()%255)
        print(f)
        cell.backgroundColor = UIColor(colorLiteralRed: f, green: f, blue: f, alpha: 0.5)
        return cell
    }
    
    func refresh(){
        dataSource = dataSource + ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
        tableViewC.tableView.reloadData()
        tableViewC.refreshControl?.endRefreshing()
    }
}

