//
//  ScoreBoardViewController.swift
//  test
//
//  Created by etudiant on 24/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var btnQuit: UIButton!
    
    var score: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        // Do any additional setup after loading the view.
        
        //affiche score
        lblScore.text = String(score)
        
        //affiche message
        if(score < 500){
            lblMessage.text = "You loose! Try again..."
        }
        else{
            lblMessage.text = "You won!"
        }
    }

    
    //quit the application
    @IBAction func quit(_ sender: Any) {
        exit(0)
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
