//
//  AppDelegate.swift
//  Sample
//
//  Created by Apiphoom Chuenchompoo on 17/9/2567 BE.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var audioPlayer: AVAudioPlayer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupBackgroundMusic()
        return true
    }

    
    func setupBackgroundMusic() {
        guard let audioFileURL = Bundle.main.url(forResource: "test", withExtension: "mp3") else {
                   print("Audio file not found in Resources folder")
                   return
               }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: audioFileURL)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error setting up audio player: \(error.localizedDescription)")
        }
    }
    
    
}

