//
//  NewGameViewController.swift
//  test
//
//  Created by etudiant on 18/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {

    @IBOutlet weak var NewGame: UILabel!
    
    @IBOutlet weak var receive: UILabel!
    
    @IBOutlet weak var Solo: UIButton!
    
    var solo : Int! = 0
    var receivedPhrase = String()
    
    @IBAction func SoloPlayer(_ sender: UIButton) {
        solo = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        receive.text = receivedPhrase
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "soloPlayer"){
            let destinationVC = segue.destination as! MainGameViewController
            destinationVC.solo = solo
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
