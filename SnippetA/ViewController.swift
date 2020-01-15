//
//  ViewController.swift
//  SnippetA
//
//  Created by Daniel Wohlmuth on 15.01.20.
//  Copyright © 2020 Daniel Wohlmuth. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func notOk(_ sender: Any) {
        doShakeAnimation(imageView)
        playSound()
    }
    
    @IBAction func ok(_ sender: Any) {
        doAlphaAnimation(imageView)
    }
    
    var audioPlayer = AVAudioPlayer()
    
    func playSound() {
        do {
            let url = Bundle.main.url(forResource: "fail", withExtension: "mp3")
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer.play()
        } catch {
            print("Failed to play auudio file")
        }
    }
    
    func doAlphaAnimation(_ view: UIView) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 1
        animation.fromValue = 1 // Alpha
        animation.toValue = 0 // Alpha
        animation.repeatCount = 2
        animation.autoreverses = true
        view.layer.add(animation, forKey: "opacity")
    }
    

    func doShakeAnimation(_ view: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.08
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 10, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 10, y: view.center.y))
        view.layer.add(animation, forKey: "position")
    }

}

