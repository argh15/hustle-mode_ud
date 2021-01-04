//
//  ViewController.swift
//  hustle-mode
//
//  Created by Arghadeep  on 10/10/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var hustleModeLabel: UILabel!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var rocketView: UIView!
    @IBOutlet weak var shootButton: UIButton!
    @IBOutlet weak var backgroundImageDarkBlue: UIImageView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
    }

    @IBAction func shootAction(_ sender: Any) {
        self.rocketView.isHidden = false
        self.backgroundImageDarkBlue.isHidden = true
        self.shootButton.isHidden = true
        
        player?.play()
        
        animateRocket()
    }
    
    //MARK: Audio Player
    
    /// Setup for Audio Player with given url/path
    func setupAudioPlayer() {
        
        //getting the audio file from path
        if let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav") {
            //setting it to URL
            let url = URL(fileURLWithPath: path)
            
            do {
                //audio player setup
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player?.prepareToPlay()
                
            } catch let error as NSError {
                print(error.description)
            }
        }
    }
    
    //MARK: Animation
    
    /// Animates the rocket to move in upward direction
    func animateRocket() {
        
        UIView.animate(withDuration: 2.3, delay: 0, animations: {
            self.rocketImage.frame = CGRect(x: 65, y: 50, width: 245, height: 400)
        }) { (finished) in
            self.hustleModeLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
    
}

