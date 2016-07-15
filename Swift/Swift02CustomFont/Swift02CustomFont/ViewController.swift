//
//  ViewController.swift
//  Swift02CustomFont
//
//  Created by Aaron on 16/7/6.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var textDataList = ["每天来一发swift 向前人学习 向走在coding前沿的人学习","大家一起来学习吧","酷酷酷酷苦苦苦苦","微博: @AppariTT","","","","","",""]
    
    var fontList = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var fontIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeFontBtnClicked(sender: AnyObject) {
        fontIndex = (fontIndex + 1)%3
        tableView.reloadData()
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return textDataList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("fontCell", forIndexPath: indexPath)
        let text = textDataList[indexPath.row]
        
        if (text.isEmpty){
            cell.textLabel?.text = String(format: "test%ld", indexPath.row)
        }else{
            cell.textLabel?.text = text
        }
        
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontList[fontIndex], size: 20)
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

