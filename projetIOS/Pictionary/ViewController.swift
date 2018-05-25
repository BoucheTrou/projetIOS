//
//  ViewController.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 31/01/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var BPartieLocale: UIButton!
    @IBOutlet weak var BPartieEnLigne: UIButton!
    @IBOutlet weak var BOptions: UIButton!
    @IBOutlet weak var BScore: UIButton!
    static var lang : String = "Nolangage";
    var jouerUneFois : Bool = false;
    let scoreAcces:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(ViewController.lang == "Nolangage"){
            ViewController.lang = "en"
        }
        
        self.BPartieLocale.setTitle("PartieLocale".localized(lang: ViewController.lang), for: .normal)
        self.BPartieEnLigne.setTitle("PartieEnLigne".localized(lang: ViewController.lang), for: .normal)
        self.BOptions.setTitle("Options".localized(lang: ViewController.lang), for: .normal)
        self.BScore.setTitle("Score".localized(lang: ViewController.lang), for: .normal)
        scoreAcces.set(jouerUneFois, forKey: "jouerUneFois")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Retour (segue : UIStoryboardSegue){
        self.viewDidLoad();
    }

}

