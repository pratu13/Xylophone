//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit

import AVFoundation

import AudioToolbox

class ViewController: UIViewController , AVAudioPlayerDelegate {
    
    //var player : AVAudioPlayer?
    
    var audioPlayer : AVAudioPlayer!
    
    var soundArray = ["note1","note2","note3","note4","note5","note6","note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(whichNote: String){
        
//        if let soundURL = Bundle.main.url(forResource: whichNote, withExtension: "wav") {
//            var mySound: SystemSoundID = 0
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
//            // Play
//            AudioServicesPlaySystemSound(mySound)
        
        let soundUrl = Bundle.main.url(forResource: whichNote, withExtension: "wav")
        do{
         try audioPlayer =  AVAudioPlayer(contentsOf: soundUrl!)
        } catch let error as NSError{
            print(error.description)
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
//        let path = Bundle.main.path(forResource: whichNote, ofType:"wav")!
//        let url = URL(fileURLWithPath: path)
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//
//            player.prepareToPlay()
//            player.play()
//        } catch let error as NSError {
//            print(error.description)
//            // couldn't load file :(
//        }
    }
    @IBAction func notePressed(_ sender: UIButton) {
        
        let selectedButton : String = soundArray[sender.tag-1]
        
        playSound(whichNote: selectedButton)
        
        
    }
    
  

}

