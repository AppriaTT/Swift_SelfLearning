//
//  ViewController.swift
//  swift14 EmojiMachine
//
//  Created by Aaron on 16/7/15.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
@IBOutlet weak var pickerView0: UIPickerView!
    let emojiArray = ["🐔","🐶","🐷","🐱","🐟","🐘","🐒","🐂","🐴","🐲","🐰","🐯","🐍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beginBtn.layer.cornerRadius = 5
        beginBtn.layer.masksToBounds = true
        
        pickerView0.delegate = self
        pickerView0.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var beginBtn: UIButton!
    @IBAction func beginClicked(sender: UIButton) {
        pickerView0.selectRow(random() % (emojiArray.count + 1), inComponent: 0, animated: true)
        pickerView0.selectRow(random() % (emojiArray.count + 1), inComponent: 1, animated: true)
        pickerView0.selectRow(random() % (emojiArray.count + 1), inComponent: 2, animated: true)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return emojiArray.count
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat
    {
    return pickerView0.bounds.size.width / 3.0
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return pickerView0.bounds.size.width / 2.0
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView
    {
        let label = UILabel()
        label.text = emojiArray[row]
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name:String("Apple Color Emoji"), size: 80)
        
        return label
    }

}

