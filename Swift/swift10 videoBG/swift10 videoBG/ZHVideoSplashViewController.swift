//
//  ZHVideoSplashViewController.swift
//  swift10 videoBG
//
//  Created by Aaron on 16/7/13.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer
public class ZHVideoSplashViewController: UIViewController {
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel:Float = 1.0
    
    public var backgroundColor : UIColor = UIColor.blackColor(){
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    public var alwaysRepeat:Bool = true{
        didSet{
            if alwaysRepeat{
                NSNotificationCenter.defaultCenter().addObserver(self, selector: "playerItemDidReachEnd", name: AVPlayerItemDidPlayToEndTimeNotification, object: moviePlayer.player?.currentItem)
            }
        }
    }
    public var videoFrame:CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    
    public var contentURL : NSURL = NSURL() {
        didSet{
            setMoviePlayer(contentURL)
        }
    }
    //重新播放
    func playerItemDidReachEnd() {
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }
    
    private func setMoviePlayer(url:NSURL){
        let videoCutter = VideoCutter()
        //从哪开始 播多久
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as NSURL?{
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
//                    dispatch_async(dispatch_get_main_queue()){
                        self.moviePlayer.player = AVPlayer(URL: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                        
//                    }
                
//                })
            }
            
        }
        
    }
    
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        self.view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    public override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
