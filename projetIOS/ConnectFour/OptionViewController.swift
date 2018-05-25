//
//  OptionViewController.swift
//  ConnectFour
//
//  Created by hubert mouginot on 19/02/2017.
//  Copyright © 2017 hubert.mouginot. All rights reserved.
//

import UIKit
import AVFoundation

class OptionViewController: UIViewController {

    @IBOutlet weak var OutletBackground: UIImageView!
    @IBOutlet weak var OutletRetour: UIButton!
    var them : Int = 3
    var button : Int = 3
    var sound : Bool = true
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    @IBOutlet weak var Choixthem: UISegmentedControl!
    @IBOutlet weak var monSond: UISwitch!
    @IBOutlet weak var choixButton: UISegmentedControl!
    @IBOutlet weak var labelThem: UILabel!
    @IBOutlet weak var labelBouton: UILabel!
    @IBOutlet weak var labelSound: UILabel!
    @IBOutlet weak var labelTitre: UILabel!
    
    @IBAction func changeThem(_ sender: Any) {
        switch Choixthem.selectedSegmentIndex {
        case 0:
            OutletBackground.image = UIImage(named: "CF_backgroundDark.PNG")
            them = 0
        case 1:
            OutletBackground.image = UIImage(named: "CF_backgroundLight.PNG")
            them = 1
        case 2:
            OutletBackground.image = UIImage(named: "CF_backgroundBlue.PNG")
            them = 2
        case 3:
            OutletBackground.image = UIImage(named: "CF_background.jpg")
            them = 3
        default:
            break
        }
        if (them==0) {
            Choixthem.tintColor = UIColor.white
            choixButton.tintColor = UIColor.white
            labelThem.textColor = UIColor.white
            labelSound.textColor = UIColor.white
            labelBouton.textColor = UIColor.white
            labelTitre.textColor = UIColor.white
        }else{
            Choixthem.tintColor = UIColor.black
            choixButton.tintColor = UIColor.black
            labelThem.textColor = UIColor.black
            labelSound.textColor = UIColor.black
            labelBouton.textColor = UIColor.black
            labelTitre.textColor = UIColor.black
        }
        startAudio()
    }
    
    @IBAction func changeButton(_ sender: Any) {
        switch choixButton.selectedSegmentIndex {
        case 0:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlack"), for: UIControlState.normal)
            button = 0
        case 1:
             OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
            button = 1

        case 2:
             OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlue.png"), for: UIControlState.normal)
            button = 2
        case 3:
  OutletRetour.setBackgroundImage(UIImage(named: "CF_return.png"), for: UIControlState.normal)
            button = 3
        default:
            break
        }
    }
    
    func startAudio() {
        if(audioPlayer.isPlaying){
            audioPlayer.stop()
        }
        var name : String = ""
        switch them{
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
        audioPlayer.play()
    }
    
    @IBAction func changeSond(_ sender: Any) {
        sound = monSond.isOn
        if(sound){
            audioPlayer.volume = 1
        }
        else{
            audioPlayer.volume = 0
        }
        startAudio()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        choixButton.selectedSegmentIndex = button
        Choixthem.selectedSegmentIndex = them
        // Do any additional setup after loading the view.
        switch button{
        case 0:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlack.png"), for: UIControlState.normal)
        case 1:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
        case 2:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlue.png"), for: UIControlState.normal)
        case 3:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_return.png"), for: UIControlState.normal)
        default:
            break
        }
        switch them {
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
        if (them==0) {
            Choixthem.tintColor = UIColor.white
            choixButton.tintColor = UIColor.white
            labelThem.textColor = UIColor.white
            labelSound.textColor = UIColor.white
            labelBouton.textColor = UIColor.white
            labelTitre.textColor = UIColor.white
        }else{
            Choixthem.tintColor = UIColor.black
            choixButton.tintColor = UIColor.black
            labelThem.textColor = UIColor.black
            labelSound.textColor = UIColor.black
            labelBouton.textColor = UIColor.black
            labelTitre.textColor = UIColor.black
        }
        monSond.isOn = sound
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
