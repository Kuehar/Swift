//
//  SoundPlayer.swift
//  MyMusic
//
//  Created by kuehar on 2023/04/09.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    var cymbalPlayer: AVAudioPlayer!
    
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    var guitarPlayer: AVAudioPlayer!
    
    func cymbalPlay(){
        do{
            cymbalPlayer = try AVAudioPlayer(data:cymbalData)
            cymbalPlayer.play()
        }catch{
            print("音楽再生でエラーが生じました。")
        }
    }
    
    func guitarPlay(){
        do{
            guitarPlayer = try AVAudioPlayer(data:guitarData)
            guitarPlayer.play()
        }catch{
            print("音楽再生でエラーが生じました。")
        }
    }
}
