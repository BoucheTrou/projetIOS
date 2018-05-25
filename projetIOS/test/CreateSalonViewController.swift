//
//  CreateSalonViewController.swift
//  test
//
//  Created by etudiant on 18/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class CreateSalonViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameSalon: UITextField!
    @IBOutlet weak var totalLive: UITextField!
    @IBOutlet weak var mdp: UITextField?
    @IBOutlet weak var btn: UIButton!
    //A CORRIGER ET ENLEVER QUAND ON FERA UNE PAGE DE CONNEXION
    let u = User(surname: "warmcy", firstName: "Cylia", lastName: "Harbane", address: "21 rue andré maginot", mail: "hcylia@hotmail.fr", phone: "0781450729")
    @IBAction func roomCreation(_ sender: Any) {
        if(mdp!.text != ""){
            let room = Room(nameRoom: nameSalon.text!, nbTryMax: Int(totalLive.text!)!, user1: u, pwd: (mdp!.text)!)
            let p = Player(hisRoom: room, user: u)
        }
        else{
            let room = Room(nameRoom: nameSalon.text!,nbTryMax: Int(totalLive.text!)!, user1: u)
            let p = Player(hisRoom: room, user: u)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.isEnabled = false
        nameSalon.delegate = self
        totalLive.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == nameSalon){
            if(nameSalon.text == ""){
                nameSalon.text = ""
                nameSalon.backgroundColor = UIColor.red
            }
            else{
                nameSalon.backgroundColor = UIColor.white
            }
        }
       if(textField == totalLive){
            if(textField.text! == "" || invalideNbTry(nbtry: textField.text!)){
                textField.text = ""
                textField.backgroundColor = UIColor.red
            }
            else{
                textField.backgroundColor = UIColor.white
            }
        }
        if(nameSalon.text != "" && totalLive.text != ""){
            btn.isEnabled = true
        }
        else
        {
            btn.isEnabled = false
        }

    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(nameSalon.text != "" && totalLive.text != ""){
            btn.isEnabled = true
        }
        else
        {
            btn.isEnabled = false
        }
    }
    func invalideNbTry (nbtry : String) -> Bool {
        do{
            let reg = try NSRegularExpression(pattern: "(^[5-9]$)|(^10$)", options: .caseInsensitive)
            let match = reg.numberOfMatches(in: nbtry, options: .reportProgress, range: NSRange(location: 0, length: nbtry.characters.count))
            if (match==0){
                return true
            }
        }
        catch {
            NSLog("Erreur")
        }
        
        return false
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
