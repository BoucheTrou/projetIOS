//
//  MenuViewController.swift
//  ConnectFour
//
//  Created by hubert mouginot on 19/02/2017.
//  Copyright © 2017 hubert.mouginot. All rights reserved.
//

import UIKit
import AVFoundation

class MenuViewController: UIViewController, AVAudioPlayerDelegate{

    @IBOutlet weak var OutletBackground: UIImageView!
    var lethem : Int = 3
    var lebutton : Int = 3
    var sound : Bool = true
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var settingsbutton: UIButton!
    
    @IBOutlet weak var OutletRetour: UIButton!
    func startAudio() {
        var name : String = ""
        switch lethem{
        case 0:
            name = "DarkThemeMenu"
        case 1:
            name = "LightThemeMenu"
        case 2:
            name = "NormalThemeMenu"
        case 3:
            name = "NormalThemeMenu"
        default:
            name = "NormalThemeMenu"
        }
        let filePath = Bundle.main.path(forResource: name, ofType: "mp3")
        let fileURL = NSURL.fileURL(withPath: filePath!)
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: fileURL, fileTypeHint: AVFileTypeMPEGLayer3)
            audioPlayer.numberOfLoops = -1
            if(sound){
                audioPlayer.volume = 1
            }
            else{
                audioPlayer.volume = 0
            }
        } catch {
            self.present(UIAlertController.init(title: "Error", message: "Error Message", preferredStyle: .alert), animated: true, completion: nil)
        }
        if(!audioPlayer.isPlaying){
            audioPlayer.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAudio()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var nomPlayer1 : String = OutletPlayer1.text!
        //var nomPlayer2 : String = OutletPlayer2.text!
        if segue.identifier == "segueOption"  {
            // Definition du controler de destinatation
            let destinationVC = segue.destination
                as! OptionViewController
            
            destinationVC.them = lethem
            destinationVC.button = lebutton
            destinationVC.audioPlayer = audioPlayer
            destinationVC.sound = sound
        }

        if segue.identifier == "seguePlay"  {
            // Definition du controler de destinatation
            let destinationVC = segue.destination
                as! PlayeViewController
            
            destinationVC.colorBouton = lebutton
            destinationVC.lebackground = lethem
            destinationVC.audioPlayer = audioPlayer
            destinationVC.sound = sound
        }
        
    }
    
    @IBAction func fini(segue : UIStoryboardSegue) {
        // Définition du contrôleur source
        if(segue.identifier == "segueRetourOption"){
            
            let sourceVC = segue.source as! OptionViewController
            // Transfert de donnéesA
            // ...
            lethem = sourceVC.them
            lebutton = sourceVC.button
            audioPlayer = sourceVC.audioPlayer
            sound = sourceVC.sound
            
            switch lethem {
            case 0:
                OutletBackground.image = UIImage(named: "CF_backgroundDark.PNG")
            case 1:
                OutletBackground.image = UIImage(named: "CF_backgroundLight.PNG")
            case 2:
                OutletBackground.image = UIImage(named: "CF_backgroundBlue.PNG")
            case 3:
                OutletBackground.image = UIImage(named: "CF_background.jpg")
            default:
                break
            }
            switch lebutton {
            case 0:
                playbutton.setBackgroundImage(UIImage(named: "CF_playBlack.png"), for: UIControlState.normal)
                settingsbutton.setBackgroundImage(UIImage(named: "CF_settingsBlack.png"), for: UIControlState.normal)
                OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlack"), for: UIControlState.normal)
                
            case 1:
                playbutton.setBackgroundImage(UIImage(named: "CF_BoutonPlay.png"), for: UIControlState.normal)
                settingsbutton.setBackgroundImage(UIImage(named: "CF_BoutonSettings.png"), for: UIControlState.normal)
                OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
            case 2:
                
                playbutton.setBackgroundImage(UIImage(named: "CF_playBlue.png"), for: UIControlState.normal)
                settingsbutton.setBackgroundImage(UIImage(named: "CF_settingBlue.png"), for: UIControlState.normal)
                OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
            case 3:
                
                playbutton.setBackgroundImage(UIImage(named: "CF_Play.png"), for: UIControlState.normal)
                settingsbutton.setBackgroundImage(UIImage(named: "CF_settings.png"), for: UIControlState.normal)
                OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
            default:
                break
            }

            
        }
        
        if(segue.identifier == "segueBackPlay"){
            let sourceVC = segue.source as! PlayeViewController
            audioPlayer = sourceVC.audioPlayer
            sound = sourceVC.sound
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
    @IBAction func backAppMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "choiceGame") as UIViewController
        self.present(controller, animated: true, completion: nil)
        audioPlayer.stop()
    }
        
}



