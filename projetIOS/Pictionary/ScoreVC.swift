//
//  ScoreVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 01/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {
    @IBOutlet weak var BRetour: UIButton!
    @IBOutlet weak var Titre: UILabel!
    @IBOutlet weak var premier: UILabel!
    @IBOutlet weak var deuxieme: UILabel!
    @IBOutlet weak var troisieme: UILabel!
    @IBOutlet weak var quatrieme: UILabel!
    let scoreAcces:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BRetour.setImage(UIImage(named: "Bretour".localized(lang: ViewController.lang)), for: UIControlState.normal)
        Titre.text = "TitreScore".localized(lang: ViewController.lang)
        print(scoreAcces.bool(forKey: "jouerUneFois"))
        if(scoreAcces.bool(forKey: "jouerUneFois")){
            premier.text! = scoreAcces.string(forKey: "premier")!
            deuxieme.text! = scoreAcces.string(forKey: "deuxieme")!
            switch scoreAcces.integer(forKey: "NbEquipes") {
            case 3:
                troisieme.text! = scoreAcces.string(forKey: "troisieme")!
                quatrieme.text! = "-"
            case 4:
                troisieme.text! = scoreAcces.string(forKey: "troisieme")!
                quatrieme.text! = scoreAcces.string(forKey: "quatrieme")!
            default:
                troisieme.text! = "-"
                quatrieme.text! = "-"
            }
        }
        else{
            premier.text! = "-"
            deuxieme.text! = "-"
            troisieme.text! = "-"
            quatrieme.text! = "-"
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
