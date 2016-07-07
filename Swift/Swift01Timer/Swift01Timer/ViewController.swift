//
//  ViewController.swift
//  Swift01Timer
//
//  Created by Aaron on 16/7/6.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeL: UILabel!
    
    var timer = NSTimer()
    var Counter = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playBtnClicked(sender: AnyObject) {
        //如果正在播放返回
        playBtn.enabled = false
        pauseBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBtnClicked(sender: AnyObject) {
        pauseBtn.enabled = false
        playBtn.enabled = true
        timer.invalidate()
        
    }
    @IBAction func resetClicked(sender: AnyObject) {
        Counter = 0
        timer.invalidate()
        playBtn.enabled = true
        pauseBtn.enabled = true
        timeL.text = String(Counter)
    }
    func updateTimer(){
        Counter = Counter + 0.1;
        timeL.text = String(format: "%.1f", Counter)
    }
}
