//
//  MainViewController.swift
//  cameraSample
//
//  Created by kuehar on 2023/05/22.
//

import UIKit
import Photos
import SwiftUI
import AVFoundation

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.backgroundColor = .orange
        button.frame = CGRect(x: UIScreen.main.bounds.width/3, y: 200, width: UIScreen.main.bounds.width/3, height: 50)
        button.setTitle("カメラ起動", for: .normal)
        button.addTarget(self, action: #selector(tapedAudio), for: .touchUpInside)
        view.addSubview(button)
        
        allowedRequestStatus()
    }
    
    @objc  func tapedAudio(sender: UIButton) {
        self.present(AudioViewController(), animated: true, completion: nil)
    }
    
    func allowedRequestStatus() -> Bool{
        var avState = false
        var phState = false
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            avState = true
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
                DispatchQueue.main.async {
                    avState = granted
                }
            })
        default:
            avState = false
            break
        }
        
        switch PHPhotoLibrary.authorizationStatus(for: .addOnly) {
        case .authorized:
            phState = true
            break
            
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly, handler: { status in
                DispatchQueue.main.async {
                    if status == .authorized {
                        phState = true
                    }
                }
            })
        default :
            phState = false
            break
        }
        
        if avState && phState {
            return true
        }else{
            return false
        }
    }
}

struct HostedViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return MainViewController()
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
}

