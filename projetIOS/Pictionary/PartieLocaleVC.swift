//
//  PartieLocaleVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 31/01/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class PartieLocaleVC: UIViewController {
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var BPlus: UIButton!
    @IBOutlet weak var BMoins: UIButton!
    @IBOutlet weak var TitreReglage: UILabel!
    @IBOutlet weak var LTextEquipe: UILabel!
    @IBOutlet weak var LNbEquipe: UILabel!
    @IBOutlet weak var TFEquipe1: UITextField!
    @IBOutlet weak var TFEquipe2: UITextField!
    @IBOutlet weak var TFEquipe3: UITextField!
    @IBOutlet weak var TFEquipe4: UITextField!
    @IBOutlet weak var BSuivant: UIButton!
    @IBOutlet weak var BRetour: UIButton!
    let langage:UserDefaults = UserDefaults.standard
    var valeur : Int = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch valeur  {
            
        case 2:
            BMoins.isEnabled = false
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = true
            self.TFEquipe4.isHidden = true
            break
            
        case 3:
            BMoins.isEnabled = true
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = true
            break
            
        case 4:
            BMoins.isEnabled = true
            BPlus.isEnabled = false
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = false
            break
            
        default:
            break
        }
        
        TitreReglage.text = "TitreReglage".localized(lang: ViewController.lang)
        LTextEquipe.text = "TextEquipe".localized(lang: ViewController.lang)
        TFEquipe1.text = "Equipe1".localized(lang: ViewController.lang)
        TFEquipe2.text = "Equipe2".localized(lang: ViewController.lang)
        TFEquipe3.text = "Equipe3".localized(lang: ViewController.lang)
        TFEquipe4.text = "Equipe4".localized(lang: ViewController.lang)
        BRetour.setImage(UIImage(named: "Bretour".localized(lang: ViewController.lang)), for: UIControlState.normal)
        BSuivant.setImage(UIImage(named: "BSuivant".localized(lang: ViewController.lang)), for: UIControlState.normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Plus(_ sender: Any) {
        if(valeur < 4){
            valeur += 1
        }
        LNbEquipe.text = String(valeur)
        
        switch valeur  {
            
        case 3:
            BMoins.isEnabled = true
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = true
            break
            
        case 4:
            BPlus.isEnabled = false
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = false
            break
            
        default:break
        }
    }
    
    @IBAction func Moins(_ sender: Any) {
        if(valeur > 2){
            valeur -= 1
        }
        LNbEquipe.text = String(valeur)
    
        switch valeur  {
            
        case 2:
            BMoins.isEnabled = false
            self.TFEquipe3.isHidden = true
            self.TFEquipe4.isHidden = true
            break
            
        case 3:
            BMoins.isEnabled = true
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = true
            break
            
            
        default:break
        }
    }
    
    @IBAction func Equipe1Vide(_ sender: Any) {
        if(self.TFEquipe1.text?.isEmpty)! {
            TFEquipe1.text = "Equipe1".localized(lang: ViewController.lang)
        }
    }
    
    @IBAction func Equipe2Vide(_ sender: Any) {
        if(self.TFEquipe2.text?.isEmpty)! {
            TFEquipe2.text = "Equipe2".localized(lang: ViewController.lang)
        }
        
    }
    
    @IBAction func Equipe3Vide(_ sender: Any) {
        if(self.TFEquipe3.text?.isEmpty)! {
            TFEquipe3.text = "Equipe3".localized(lang: ViewController.lang)
        }
    }
    
    @IBAction func Equipe4Vide(_ sender: Any) {
        if(self.TFEquipe4.text?.isEmpty)! {
            TFEquipe4.text = "Equipe4".localized(lang: ViewController.lang)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "SegueRP-CP"){
            if let destViewController = segue.destination as? ChoixTypePartieVC {
                destViewController.NEquipe1 = TFEquipe1.text
                destViewController.NEquipe2 = TFEquipe2.text
                destViewController.NEquipe3 = TFEquipe3.text
                destViewController.NEquipe4 = TFEquipe4.text
                destViewController.NBEquipe = valeur
            }
        }
        
    }
    
    
    
    @IBAction func Retour (segue : UIStoryboardSegue){
        switch valeur  {
            
        case 2:
            BMoins.isEnabled = false
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = true
            self.TFEquipe4.isHidden = true
            break
            
        case 3:
            BMoins.isEnabled = true
            BPlus.isEnabled = true
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = true
            break
            
        case 4:
            BMoins.isEnabled = true
            BPlus.isEnabled = false
            self.TFEquipe3.isHidden = false
            self.TFEquipe4.isHidden = false
            break
            
        default:
            break
        }
        
    }

}
