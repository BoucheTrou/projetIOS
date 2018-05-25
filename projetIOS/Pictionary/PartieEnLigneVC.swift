//
//  PartieEnLigneVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 31/01/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class PartieEnLigneVC: UIViewController {
    @IBOutlet weak var BRetour: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        BRetour.setImage(UIImage(named: "Bretour".localized(lang: ViewController.lang)), for: UIControlState.normal)
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
