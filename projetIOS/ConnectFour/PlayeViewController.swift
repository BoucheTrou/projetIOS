//
//  PlayeViewController.swift
//  ConnectFour
//
//  Created by hubert mouginot on 19/02/2017.
//  Copyright © 2017 hubert.mouginot. All rights reserved.
//

import UIKit
import AVFoundation

class PlayeViewController: UIViewController,UITextFieldDelegate {
    var lebackground : Int = 3
    var colorBouton : Int = 3
    var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    var sound : Bool = true
   
    @IBOutlet weak var OutletPlayer1: UITextField!
    @IBOutlet weak var OutletPlayer2: UITextField!
    @IBOutlet weak var OutletBackground: UIImageView!
    @IBOutlet weak var OutletRetour: UIButton!

    @IBOutlet weak var labelErreur1: UILabel!
    @IBOutlet weak var labelErreur2: UILabel!
    @IBOutlet weak var labelErreur3: UILabel!
 
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var labelTitre: UILabel!
    @IBOutlet weak var labelPlayer2: UILabel!
    @IBOutlet weak var labelPlayer1: UILabel!
    
    @IBAction func goPlay(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var nomPlayer1 : String = OutletPlayer1.text!
        //var nomPlayer2 : String = OutletPlayer2.text!
        if segue.identifier == "segueVersNouveauViewController"  {
            // Definition du controler de destinatation
            let destinationVC = segue.destination
                as! ConnectFourViewController
            
            destinationVC.nomJoueur1 = OutletPlayer1.text!
            destinationVC.nomJoueur2 = OutletPlayer2.text!
            destinationVC.lebackground = lebackground
            destinationVC.colorBouton = colorBouton
            destinationVC.audioPlayer = audioPlayer
            destinationVC.sound = sound
        }
    }
    
    @IBAction func fini(segue : UIStoryboardSegue) {
        // Définition du contrôleur source
        //let sourceVC = segue.source as! AffichageViewController
        // Transfert de donnéesA
        // ...
        if( segue.identifier == "segueVersNouveauViewController"){
            let sourceVC = segue.source as! ConnectFourViewController
            
            audioPlayer = sourceVC.audioPlayer
            sound = sourceVC.sound
            //enregistrePartie(name1: OutletPlayer1.text!, name2: OutletPlayer2.text!, nbStatus: sourceVC.winner)
            
        }
        startAudio()
        cleanInterface()
    }
    
    
    func startAudio() {
        var name : String = ""
        switch lebackground{
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch colorBouton{
        case 0:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlack.png"), for: UIControlState.normal)
            buttonPlay.setBackgroundImage(UIImage(named: "CF_playBlack.png"), for: UIControlState.normal)
        case 1:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_BoutonBack.png"), for: UIControlState.normal)
            buttonPlay.setBackgroundImage(UIImage(named: "CF_BoutonPlay.png"), for: UIControlState.normal)
        case 2:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_returnBlue.png"), for: UIControlState.normal)
            buttonPlay.setBackgroundImage(UIImage(named: "CF_playBlue.png"), for: UIControlState.normal)
        case 3:
            OutletRetour.setBackgroundImage(UIImage(named: "CF_return.png"), for: UIControlState.normal)
            buttonPlay.setBackgroundImage(UIImage(named: "CF_Play.png"), for: UIControlState.normal)
        default:
            break
        }
        switch lebackground {
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
        if (lebackground==0) {
            
            labelTitre.textColor = UIColor.white
            labelPlayer2.textColor = UIColor.white
            labelPlayer1.textColor = UIColor.white
        }else{
            
            labelTitre.textColor = UIColor.black
            labelPlayer2.textColor = UIColor.black
            labelPlayer1.textColor = UIColor.black
        }
        // Do any additional setup after loading the view.
        buttonPlay.isEnabled = false
        labelErreur1.isHidden = true
        labelErreur2.isHidden = true
        labelErreur3.isHidden = true
        OutletPlayer1.delegate = self
        OutletPlayer2.delegate = self
        /*
        let path = getFilePath(nomFichier: "listeJoueur", typeFichier: "plist")
        print(path)
        var contenu : String = ""
        do {
            try contenu = String(contentsOfFile:path, encoding:String.Encoding.utf8)
        } catch {
            print("Erreur au moment de la lecture")
        }
        print(contenu)
        let tabFic = NSArray(contentsOfFile: path) as! [[String:String]]// NSDictionary
        
        for ligne in tabFic {
            laListJoeur.append(Joueur(pseudo: ligne["pseudo"]!, nbGamePlay: ligne["nbGamePlay"]!, nbGameWin: ligne["nbGameWin"]!, nbGameLost: ligne["nbGameLost"]!))
        }
        */
    }
    /*
    func enregistrePartie(name1: String , name2 : String, nbStatus : Int){
        var i : Int = 0
        var trouver : Bool = false
        while( i<laListJoeur.count && !trouver){
            if( laListJoeur[i].pseudo == name1){
                switch nbStatus {
                case 1:
                    laListJoeur[i].nbGameWin = String(Int(laListJoeur[i].nbGameWin)!+1)
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                case 2:
                    laListJoeur[i].nbGameLost = String(Int(laListJoeur[i].nbGameLost)!+1)
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                default:
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                }
                trouver = true
            }
            i += 1
        }
        if(!trouver){
            let j1 = Joueur()
            j1.pseudo = name1
            switch nbStatus {
            case 1:
                laListJoeur[i].nbGameLost = String(0)
                laListJoeur[i].nbGameWin = String(1)
                laListJoeur[i].nbGamePlay = String(1)
            case 2:
                laListJoeur[i].nbGameWin = String(0)
                laListJoeur[i].nbGameLost = String(1)
                laListJoeur[i].nbGamePlay = String(1)
            default:
                laListJoeur[i].nbGameWin = String(0)
                laListJoeur[i].nbGameLost = String(0)
                laListJoeur[i].nbGamePlay = String(1)
            }
        }
        
        i = 0
        trouver = false
        while( i<laListJoeur.count && !trouver){
            if( laListJoeur[i].pseudo == name2){
                switch nbStatus {
                case 1:
                    laListJoeur[i].nbGameLost = String(Int(laListJoeur[i].nbGameLost)!+1)
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                case 2:
                    laListJoeur[i].nbGameWin = String(Int(laListJoeur[i].nbGameWin)!+1)
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                default:
                    laListJoeur[i].nbGamePlay = String(Int(laListJoeur[i].nbGamePlay)!+1)
                }
                trouver = true
            }
            i += 1
        }
        if(!trouver){
            let j2 = Joueur()
            j2.pseudo = name2
            switch nbStatus {
            case 1:
                laListJoeur[i].nbGameWin = String(0)
                laListJoeur[i].nbGameLost = String(1)
                laListJoeur[i].nbGamePlay = String(1)
            case 2:
                laListJoeur[i].nbGameLost = String(0)
                laListJoeur[i].nbGameWin = String(1)
                laListJoeur[i].nbGamePlay = String(1)
            default:
                laListJoeur[i].nbGameWin = String(0)
                laListJoeur[i].nbGameLost = String(0)
                laListJoeur[i].nbGamePlay = String(1)
            }
        }
        
        
    }
    
    func getFilePath(nomFichier: String, typeFichier: String) -> String{
        let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory,  .userDomainMask, true)[0]
        let writePath = documents.appending("/\(nomFichier).\(typeFichier)")
        let fileManager = FileManager.default
        if (!fileManager.fileExists(atPath: writePath)) {
            let sourcepath = Bundle.main.path(forResource: nomFichier, ofType: typeFichier)
            do {
                try fileManager.copyItem(atPath: sourcepath!, toPath: writePath)
            }
            catch {
                print("Erreur au moment de la copie")
            }
        }
        return writePath
    }*/
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(textField.text == ""){
            if(textField == OutletPlayer1){
                labelErreur1.isHidden = false
            }else{
                labelErreur2.isHidden = false
            }
            buttonPlay.isEnabled = false
            return false
        }else{
            if(textField == OutletPlayer1){
                labelErreur1.isHidden = true
            }else{
                labelErreur2.isHidden = true
            }
            return true
        }
    }
    func cleanInterface(){
        buttonPlay.isEnabled = false
        OutletPlayer2.text = ""
        OutletPlayer1.text = ""
        labelErreur3.isHidden = true
        labelErreur2.isHidden = true
        labelErreur1.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(OutletPlayer1.text != "" && OutletPlayer2.text != ""){
            if(OutletPlayer1.text == OutletPlayer2.text){
                labelErreur3.isHidden = false
                buttonPlay.isEnabled = false
            }else{
                labelErreur3.isHidden = true
                buttonPlay.isEnabled = true
            }
            
        }else{
            buttonPlay.isEnabled = false
        }
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
