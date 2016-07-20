//
//  ViewController.swift
//  swift17 tumblrMenu
//
//  Created by Aaron on 16/7/20.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func unwindToMainViewController (sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

