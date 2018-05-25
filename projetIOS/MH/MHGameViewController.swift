//
//  GameViewController.swift
//  Mountain Hunt
//
//  Created by Haoxuan DONG on 25/01/17.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
var mainMenu = AVAudioPlayer()
var musique = Bool(true)

class MHGameViewController: UIViewController {
    

    var colorChar = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //main menu music
        let filePath = Bundle.main.path(forResource: "Main", ofType: "mp3")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        do {
            mainMenu = try AVAudioPlayer(contentsOf: audioNSURL as URL)
        }
        catch { return print("Cannot find the audio") }
        mainMenu.numberOfLoops = -1

        if (musique==true){
            mainMenu.play()
        }
        print(colorChar)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    @IBAction func exit(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "choiceGame") as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (UIInterfaceOrientationMask(rawValue: UIInterfaceOrientationMask.landscapeLeft.rawValue))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func prepare(segue: UIStoryboardSegue, sender: AnyObject?){
        if segue.identifier == "seguePlay" {
            if #available(iOS 9.0, *) {
                let control = segue.destination as! MHPlayViewController
                control.colorPerso = colorChar
                print(colorChar)
                } else {
                // Fallback on earlier versions
            }
        }
    }
}
