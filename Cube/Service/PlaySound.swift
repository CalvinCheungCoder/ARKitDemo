//
//  PlaySound.swift
//  Cube
//
//  Created by Calvin on 2017/7/24.
//  Copyright © 2017年 Calvin. All rights reserved.
//

import AVFoundation

func playSound(of effect: SoundEffects) {
    
    OperationQueue.main.addOperation {
        
        let player : AVAudioPlayer!
        if let url = Bundle.main.url(forResource: effect.rawValue, withExtension: "mp3", subdirectory: "resource") {
            
            player = try? AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }
}

enum SoundEffects:String{
    case explosion = "explosion"
    case collision = "collision"
    case torpedo = "torpedo"
}
