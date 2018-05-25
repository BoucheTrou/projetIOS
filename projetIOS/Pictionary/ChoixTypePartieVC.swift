//
//  ChoixTypePartieVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 01/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class ChoixTypePartieVC: UIViewController {
    @IBOutlet weak var LEq1: UILabel!
    @IBOutlet weak var LEq2: UILabel!
    @IBOutlet weak var LEq3: UILabel!
    @IBOutlet weak var LEq4: UILabel!
    @IBOutlet weak var Titre: UILabel!
    @IBOutlet weak var BPL: UIButton!
    @IBOutlet weak var BPC: UIButton!
    @IBOutlet weak var BRetour: UIButton!
    var NEquipe1: String? = "";
    var NEquipe2: String? = "";
    var NEquipe3: String? = "";
    var NEquipe4: String? = "";
    var NBEquipe: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LEq1.text = NEquipe1;
        LEq2.text = NEquipe2;
        
        switch NBEquipe{
        case 3:
            LEq3.text = NEquipe3;
            LEq4.isHidden = true;
            break
            
        case 4:
            LEq3.text = NEquipe3;
            LEq4.text = NEquipe4;
            break
            
            
        default:
            LEq3.isHidden = true;
            LEq4.isHidden = true;
            break
        
        }
        
        self.Titre.text = "TitreTypePartie".localized(lang: ViewController.lang)
        BPL.setImage(UIImage(named: "BPL".localized(lang: ViewController.lang)), for: UIControlState.normal)
        BPC.setImage(UIImage(named: "BPC".localized(lang: ViewController.lang)), for: UIControlState.normal)
        BRetour.setImage(UIImage(named: "Bretour".localized(lang: ViewController.lang)), for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "RetourCP-RP"){
            if let destViewController = segue.destination as? PartieLocaleVC {
                destViewController.TFEquipe1.text = NEquipe1
                destViewController.TFEquipe2.text = NEquipe2
                destViewController.TFEquipe3.text = NEquipe3
                destViewController.TFEquipe4.text = NEquipe4
            }
        }
        else if(segue.identifier == "segue_PaL" || segue.identifier == "segue_PaC" ){
            if let destViewController = segue.destination as? InfoPartieVC {
                destViewController.NEquipe1 = NEquipe1
                destViewController.NEquipe2 = NEquipe2
                destViewController.NEquipe3 = NEquipe3
                destViewController.NEquipe4 = NEquipe4
                destViewController.NBEquipe = NBEquipe
                if(segue.identifier == "segue_PaL"){
                    destViewController.partieLongue = true
                }
                else if (segue.identifier == "segue_PaL"){
                    destViewController.partieLongue = false
                }
            }
        }
    }
    
    @IBAction func RetourChoixPartie(segue : UIStoryboardSegue){
        
    }

}
