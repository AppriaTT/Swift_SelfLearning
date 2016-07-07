//
//  ZHCameroView.swift
//  swift04 snapchatMenu
//
//  Created by Aaron on 16/7/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

import UIKit
import AVFoundation
class ZHCameroView: UIView {

    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureSession:AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        previewLayer?.frame = self.bounds
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamero = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error : NSError?
        var input : AVCaptureDeviceInput!
        
        do{
            input = try AVCaptureDeviceInput(device: backCamero)}
            
        catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil){
           captureSession?.addInput(input)
           
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            
            if (captureSession?.canAddOutput(stillImageOutput) != nil){
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                self.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
