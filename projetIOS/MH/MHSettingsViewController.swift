//
//  SettingsViewController.swift
//  Mountain Hunt
//
//  Created by Haoxuan DONG on 23/02/2017.
//  Copyright © 2017 Haoxuan DONG. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation


class MHSettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if(musique==false){
            mute.isOn = false
        }
        // Do any additional setup after loading the view.
      
    }

    @IBOutlet weak var mute: UISwitch!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Mute(_ sender: Any) {
        if (mute.isOn){
            mainMenu.play()
            musique = true
        }
        else{
            mainMenu.stop()
            musique = false
        }
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
