//
//  OptionVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 01/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class OptionVC: UIViewController {
    @IBOutlet weak var TitreLangage: UILabel!
    @IBOutlet weak var BFrance: UIButton!
    @IBOutlet weak var BUK: UIButton!
    @IBOutlet weak var BRetour: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BFrance.setImage(UIImage(named: "BFrance".localized(lang: ViewController.lang)), for: UIControlState.normal)
        BUK.setImage(UIImage(named: "BUK".localized(lang: ViewController.lang)), for: UIControlState.normal)
        BRetour.setImage(UIImage(named: "Bretour".localized(lang: ViewController.lang)), for: UIControlState.normal)
        TitreLangage.text = "TitreLangage".localized(lang: ViewController.lang)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chgtF(_ sender: Any) {
        ViewController.lang = "fr"
        viewDidLoad()
    }
    @IBAction func chgtE(_ sender: Any) {
        ViewController.lang = "en"
        viewDidLoad()
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
