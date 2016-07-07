//
//  ViewController.swift
//  swift03video
//
//  Created by Aaron on 16/7/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate, zhVideoCellDelegate{
    var dataSource = [
        zhVideo(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        zhVideo(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        zhVideo(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        zhVideo(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        zhVideo(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        zhVideo(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")]
    var zhPlayViewController = AVPlayerViewController()
    var zhPlayView = AVPlayer()
    var tableV = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //创建tableView
        self.setupTV()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupTV(){
        self.view .addSubview(tableV)
        
        tableV.frame = self.view.bounds
        tableV.backgroundColor =  UIColor.whiteColor()
        tableV.delegate = self
        tableV.dataSource = self
        tableV.registerClass(ZHVideoCell().classForCoder, forCellReuseIdentifier: "videoCell")
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("videoCell", forIndexPath: indexPath)as! ZHVideoCell
        
        cell.setupData(dataSource[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func zhVideoCellDidClicked(videoCell: ZHVideoCell) {
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        zhPlayView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        zhPlayViewController.player = zhPlayView
        
        self.presentViewController(zhPlayViewController, animated: true){
            self.zhPlayViewController.player?.play()
        }
    }
}

