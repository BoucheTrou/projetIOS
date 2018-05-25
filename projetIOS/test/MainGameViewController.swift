//
//  MainGameViewController.swift
//  test
//
//  Created by etudiant on 24/01/2017.
//  Copyright © 2017 etudiant. All rights reserved.
//

import UIKit

class MainGameViewController: UIViewController {
    
    
    @IBOutlet weak var result1: UIButton!
    @IBOutlet weak var result2: UIButton!
    @IBOutlet weak var result3: UIButton!
    @IBOutlet weak var result4: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn13: UIButton!
    @IBOutlet weak var btn14: UIButton!
    @IBOutlet weak var btn15: UIButton!
    @IBOutlet weak var btn16: UIButton!
    @IBOutlet weak var btn17: UIButton!
    @IBOutlet weak var btn18: UIButton!
    @IBOutlet weak var btn19: UIButton!
    @IBOutlet weak var btn20: UIButton!
    @IBOutlet weak var btn21: UIButton!
    @IBOutlet weak var btn22: UIButton!
    @IBOutlet weak var btn23: UIButton!
    @IBOutlet weak var btn24: UIButton!
    @IBOutlet weak var btn25: UIButton!
    @IBOutlet weak var btn26: UIButton!
    @IBOutlet weak var btn27: UIButton!
    @IBOutlet weak var btn28: UIButton!
    @IBOutlet weak var btn29: UIButton!
    @IBOutlet weak var btn30: UIButton!
    @IBOutlet weak var btn31: UIButton!
    @IBOutlet weak var btn32: UIButton!
    @IBOutlet weak var btn33: UIButton!
    @IBOutlet weak var btn34: UIButton!
    @IBOutlet weak var btn35: UIButton!
    @IBOutlet weak var btn36: UIButton!
    @IBOutlet weak var btn37: UIButton!
    @IBOutlet weak var btn38: UIButton!
    @IBOutlet weak var btn39: UIButton!
    @IBOutlet weak var btn40: UIButton!
    @IBOutlet weak var c1: UIImageView!
    @IBOutlet weak var c2: UIImageView!
    @IBOutlet weak var c3: UIImageView!
    @IBOutlet weak var c4: UIImageView!
    @IBOutlet weak var c5: UIImageView!
    @IBOutlet weak var c6: UIImageView!
    @IBOutlet weak var c7: UIImageView!
    @IBOutlet weak var c8: UIImageView!
    @IBOutlet weak var c9: UIImageView!
    @IBOutlet weak var c10: UIImageView!
    @IBOutlet weak var c11: UIImageView!
    @IBOutlet weak var c12: UIImageView!
    @IBOutlet weak var c13: UIImageView!
    @IBOutlet weak var c14: UIImageView!
    @IBOutlet weak var c15: UIImageView!
    @IBOutlet weak var c16: UIImageView!
    @IBOutlet weak var c17: UIImageView!
    @IBOutlet weak var c18: UIImageView!
    @IBOutlet weak var c19: UIImageView!
    @IBOutlet weak var c20: UIImageView!
    @IBOutlet weak var c21: UIImageView!
    @IBOutlet weak var c22: UIImageView!
    @IBOutlet weak var c23: UIImageView!
    @IBOutlet weak var c24: UIImageView!
    @IBOutlet weak var c25: UIImageView!
    @IBOutlet weak var c26: UIImageView!
    @IBOutlet weak var c27: UIImageView!
    @IBOutlet weak var c28: UIImageView!
    @IBOutlet weak var c29: UIImageView!
    @IBOutlet weak var c30: UIImageView!
    @IBOutlet weak var c31: UIImageView!
    @IBOutlet weak var c32: UIImageView!
    @IBOutlet weak var c33: UIImageView!
    @IBOutlet weak var c34: UIImageView!
    @IBOutlet weak var c35: UIImageView!
    @IBOutlet weak var c36: UIImageView!
    @IBOutlet weak var c37: UIImageView!
    @IBOutlet weak var c38: UIImageView!
    @IBOutlet weak var c39: UIImageView!
    @IBOutlet weak var c40: UIImageView!
    
    @IBOutlet weak var fin: UIButton!
    @IBOutlet weak var bois: UIImageView!
    
    var solo: Int!
    
    var s1: Sequence!
    var tab1 : [[UIButton]] = []
    var tab2 : [[UIImageView]] = []
    var room : Room!
    var p : Player!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    @IBAction func change1(_ sender: UIButton) {
        s1.Change(index: 0, btn: confirmButton)
    }
    
    @IBAction func change2(_ sender: UIButton) {
        s1.Change(index: 1, btn: confirmButton)
    }
    
    @IBAction func change3(_ sender: UIButton) {
        s1.Change(index: 2, btn: confirmButton)
    }
    
    @IBAction func change4(_ sender: UIButton) {
        s1.Change(index: 3, btn: confirmButton)
    }
    
    func createSolosequence(s: Int!)->Bool{
        var estSolo: Bool = false
        if(s == 1){
            let tableau : [UIButton] = [result1,result2,result3,result4]
            let seqtest = Sequence(tabButton: tableau)
            var randomNum:UInt32 = arc4random_uniform(9) // range is 0 to 99
            var someInt:Int = Int(randomNum)
            for _ in 0...someInt{
                seqtest.Change(index: 0, btn: fin)
            }
            randomNum = arc4random_uniform(9)
            someInt=Int(randomNum)
            for _ in 0...someInt{
                seqtest.Change(index: 1, btn: fin)
            }
            randomNum = arc4random_uniform(9)
            someInt=Int(randomNum)
            for _ in 0...someInt{
                seqtest.Change(index: 2, btn: fin)
            }
            randomNum = arc4random_uniform(9)
            someInt=Int(randomNum)
            for _ in 0...someInt{
                seqtest.Change(index: 3, btn: fin)
            }
            p.setCreatedSequence(createdSequence: seqtest)
            estSolo = true
        }
        return estSolo
    }
    
    
    @IBAction func ConfirmButton(_ sender: UIButton) {
        /*let thirdViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SetFriendViewController"))! as UIViewController
         present(thirdViewController, animated: true, completion: nil)*/
        
        p.setNbTry(nbTry: p.getNbTry()+1)
        if(!fini()){
            confirmButton.isEnabled = false
            _ = s1.verifySequence(hisPlayer: p, checker: tab2[p.getNbTry()-1])
            nouvelleSequence()
        }
        else{
            p.computingScore()
            print(p.getScore())
            confirmButton.isHidden = true
            finishButton.isHidden = false
            result1.isHidden = false
            result2.isHidden = false
            result3.isHidden = false
            result4.isHidden = false
            bois.isHidden = false
            for i in 0 ... tab1.count-1 {
                for j in 0 ... tab1[i].count-1{
                    tab1[i][j].isEnabled = false
                }
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        finishButton.isHidden = true
        confirmButton.isEnabled = false
        result1.isHidden = true
        result2.isHidden = true
        result3.isHidden = true
        result4.isHidden = true
        bois.isHidden = true
        //A CHANGER
        room = Room(nameRoom: " ", nbTryMax: 9, user1: User(surname: "warmcy", firstName: "Cylia", lastName: "Harbane", address: "21 rue andré maginot", mail: "hcylia@hotmail.fr", phone: "0781450729"))
        p = Player(hisRoom: room, user: User(surname: "warmcy", firstName: "Cylia", lastName: "Harbane", address: "21 rue andré maginot", mail: "hcylia@hotmail.fr", phone: "0781450729"))
        //A changer
        fin.isHidden = true
        tab1 = [[btn1!, btn2!, btn3!, btn4!],
                [btn5!, btn6!, btn7!, btn8!],
                [btn9!, btn10!, btn11!, btn12!],
                [btn13!,btn14!, btn15!, btn16!],
                [btn17!, btn18!, btn19!, btn20!],
                [btn21!, btn22!, btn23!, btn24!],
                [btn25!, btn26!, btn27!, btn28!],
                [btn29!,btn30!, btn31!, btn32!],
                [btn33!,btn34!, btn35!, btn36!],
                [btn37!,btn38!, btn39!, btn40!]]
        tab2 = [[c1!, c2!, c3!, c4!],
                [c5!, c6!, c7!, c8!],
                [c9!, c10!, c11!, c12!],
                [c13!,c14!, c15!, c16!],
                [c17!, c18!, c19!, c20!],
                [c21!, c22!, c23!, c24!],
                [c25!, c26!, c27!, c28!],
                [c29!,c30!, c31!, c32!],
                [c33!,c34!, c35!, c36!],
                [c37!,c38!, c39!, c40!]]
        
        createSolosequence(s: solo)
        nouvelleSequence()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nouvelleSequence(){
        for i in 0 ... tab1.count-1 {
            for j in 0 ... tab1[i].count-1{
                if(i == p.getNbTry()){
                    tab1[i][j].isEnabled = true
                    s1 = Sequence(tabButton: tab1[p.getNbTry()])
                }
                else{
                    tab1[i][j].isEnabled = false
                }
            }
        }
    }
    func fini() -> Bool{
        if(s1.verifySequence(hisPlayer: p, checker: tab2[p.getNbTry()-1])){
            p.setWin(win: true)
            return true
        }
        else if (p.getNbTry()>=room.getNbTryMax()){
            return true
        }
        else{
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueScore" {
            
            let destinationVC = segue.destination as! ScoreBoardViewController
            destinationVC.score = p.getScore()
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
