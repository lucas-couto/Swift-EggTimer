//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  
  var timer = Timer()
  var totalSeconds = 60
  var currentSeconds = 0
  var player: AVAudioPlayer!
  
  let eggTimes = [
    "Soft":   5,
    "Medium": 3,
    "Hard":  7
  ]
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    
    let hardness = sender.currentTitle!
    
    timer.invalidate()
    currentSeconds = 0
    progressView.progress = 0
    totalSeconds = eggTimes[hardness]!

    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
  }
  
  
  @objc func updateTimer(){
    if currentSeconds < totalSeconds {
      
      let resultProgress = Float(currentSeconds) / Float(totalSeconds)
      progressView.setProgress(resultProgress, animated: true)
      
      currentSeconds += 1
      
    }else{
      timer.invalidate()
      
      titleLabel.text = "DONE!"
      
      let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
      player = try! AVAudioPlayer(contentsOf: url!)
      
      player.play()
      
      
    }
  }
  
  
}
