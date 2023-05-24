//
//  AudioViewController.swift
//  cameraSample
//
//  Created by kuehar on 2023/05/22.
//

import UIKit
import Photos
import AVFoundation

class AudioViewController: UIViewController , AVCapturePhotoCaptureDelegate, AVCaptureMetadataOutputObjectsDelegate {
    
    let photoView:UIImageView! = UIImageView()
    let shutterBtn:UIButton! = UIButton()

    var avSession: AVCaptureSession!
    var avInput: AVCaptureDeviceInput!
    var avOutput: AVCapturePhotoOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoView.frame = CGRect(x: 0 ,y:0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        self.view.addSubview(photoView)

        if allowedStatus() {
            setupAVCapture()
        }
    }
    
    func allowedStatus() -> Bool{
        var avState = false
        var phState = false
        
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized{
            avState = true
        }
        
        if  PHPhotoLibrary.authorizationStatus(for: .addOnly) == .authorized{
            phState = true
        }
        
        if avState && phState {
            return true
        }else{
            return false
        }
    }

    func setupAVCapture() {
        
        self.avSession = AVCaptureSession()
        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }

            do {
                
                let deviceInput = try AVCaptureDeviceInput(device: videoDevice)
                
                if self.avSession.canAddInput(deviceInput) {
                    self.avSession.addInput(deviceInput)
                    self.avInput = deviceInput
                    
                    let photoOutput = AVCapturePhotoOutput()
                    if self.avSession.canAddOutput(photoOutput) {
                        self.avSession.addOutput(photoOutput)
                        self.avOutput = photoOutput
                        
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.avSession)
                        previewLayer.frame = self.photoView.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.avSession.sessionPreset = AVCaptureSession.Preset.photo
                        self.view.layer.addSublayer(previewLayer)
                        
                        // 撮影ボタン
                        shutterBtn.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
                        shutterBtn.setTitle("", for: UIControl.State.normal)
                        shutterBtn.backgroundColor = UIColor.white
                        shutterBtn.addTarget(self, action: #selector(takePictureTapped), for: .touchUpInside)
                        shutterBtn.layer.cornerRadius = 30
                        self.view.addSubview(shutterBtn)
                        
                        self.avSession.startRunning()
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
    }
    
    @objc  func takePictureTapped(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings()
        settings.flashMode = .auto
        settings.isHighResolutionPhotoEnabled = false
        self.avOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput,
                     didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            PHPhotoLibrary.shared().performChanges {
                  PHAssetChangeRequest.creationRequestForAsset(from:UIImage(data: imageData)!)
            } completionHandler: { success, error in
                print("Finished updating asset. " + (success ? "Success." : error!.localizedDescription))
            }
        }
    }
}
