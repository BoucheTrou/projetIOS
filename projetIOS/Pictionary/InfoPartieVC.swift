//
//  InfoPartieVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 23/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

let bleu = UIColor(red: 0, green: 97/255, blue: 170/255, alpha: 1.0)
let rouge = UIColor(red: 170/255, green: 10/255, blue: 0, alpha: 1.0)
let vert = UIColor(red: 0, green: 170/255, blue: 45/255, alpha: 1.0)
let jaune = UIColor(red: 170/255, green: 163/255, blue: 0, alpha: 1.0)

class InfoPartieVC: UIViewController {
    
    
    var NBEquipe : Int = 2
    
    @IBOutlet weak var ordre1: UILabel!
    @IBOutlet weak var ordre2: UILabel!
    @IBOutlet weak var ordre3: UILabel!
    @IBOutlet weak var ordre4: UILabel!
    
    var NEquipe1: String? = "";
    var NEquipe2: String? = "";
    var NEquipe3: String? = "";
    var NEquipe4: String? = "";
    var partieLongue: Bool = false;
    var equipes: [Equipe] = [];
    var partie: Partie = Partie();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ordre : Int = Int(arc4random_uniform(UInt32(NBEquipe)))
        
        switch NBEquipe  {
            
        case 2 :
            if(ordre == 0){
                self.ordre1.text = "1 -> " + NEquipe1!
                self.ordre1.textColor = bleu
                self.ordre2.text = "2 -> " + NEquipe2!
                ordre2.textColor = rouge
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 1, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 2, numEquipe : 2);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
            }else{
                self.ordre1.text = "1 -> " + NEquipe2!
                self.ordre1.textColor = rouge
                self.ordre2.text = "2 -> " + NEquipe1!
                self.ordre2.textColor = bleu
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 2, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 1, numEquipe : 2);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
            }
            self.ordre3.isHidden = true
            self.ordre4.isHidden = true
            
            
            
            break
            
        case 3 :
            if(ordre == 0){
                self.ordre1.text = "1 -> " + NEquipe1!
                ordre1.textColor = bleu
                self.ordre2.text = "2 -> " + NEquipe2!
                ordre2.textColor = rouge
                self.ordre3.text = "3 -> " + NEquipe3!
                ordre3.textColor = vert
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 1, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 2, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 3, numEquipe : 3);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
            }else if(ordre == 1){
                self.ordre1.text = "1 -> " + NEquipe2!
                ordre1.textColor = rouge
                self.ordre2.text = "2 -> " + NEquipe3!
                ordre2.textColor = vert
                self.ordre3.text = "3 -> " + NEquipe1!
                ordre3.textColor = bleu
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 3, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 1, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 2, numEquipe : 3);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
            }else{
                self.ordre1.text = "1 -> " + NEquipe3!
                ordre1.textColor = vert
                self.ordre2.text = "2 -> " + NEquipe1!
                ordre2.textColor = bleu
                self.ordre3.text = "3 -> " + NEquipe2!
                ordre3.textColor = rouge
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 2, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 3, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 1, numEquipe : 3);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
            }
            self.ordre3.isHidden = false
            self.ordre4.isHidden = true
            break
            
        case 4 :
            if(ordre == 0){
                self.ordre1.text = "1 -> " + NEquipe1!
                ordre1.textColor = bleu
                self.ordre2.text = "2 -> " + NEquipe2!
                ordre2.textColor = rouge
                self.ordre3.text = "3 -> " + NEquipe3!
                ordre3.textColor = vert
                self.ordre4.text = "4 -> " + NEquipe4!
                ordre4.textColor = jaune
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 1, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 2, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 3, numEquipe : 3);
                let equipe4 = Equipe(Nom: NEquipe4!, ordre: 4, numEquipe : 4);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
                self.equipes.append(equipe4);
            }else if(ordre == 1){
                self.ordre1.text = "1 -> " + NEquipe2!
                self.ordre2.text = "2 -> " + NEquipe3!
                self.ordre3.text = "3 -> " + NEquipe4!
                self.ordre4.text = "4 -> " + NEquipe1!
                ordre1.textColor = rouge
                ordre2.textColor = vert
                ordre3.textColor = jaune
                ordre4.textColor = bleu
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 4, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 1, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 2, numEquipe : 3);
                let equipe4 = Equipe(Nom: NEquipe4!, ordre: 3, numEquipe : 4);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
                self.equipes.append(equipe4);
            }else if(ordre == 2){
                self.ordre1.text = "1 -> " + NEquipe3!
                self.ordre2.text = "2 -> " + NEquipe4!
                self.ordre3.text = "3 -> " + NEquipe1!
                self.ordre4.text = "4 -> " + NEquipe2!
                ordre1.textColor = vert
                ordre2.textColor = jaune
                ordre3.textColor = bleu
                ordre4.textColor = rouge
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 3, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 4, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 1, numEquipe : 3);
                let equipe4 = Equipe(Nom: NEquipe4!, ordre: 2, numEquipe : 4);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
                self.equipes.append(equipe4);
            }else{
                self.ordre1.text = "1 -> " + NEquipe4!
                self.ordre2.text = "2 -> " + NEquipe1!
                self.ordre3.text = "3 -> " + NEquipe2!
                self.ordre4.text = "4 -> " + NEquipe3!
                ordre1.textColor = jaune
                ordre2.textColor = bleu
                ordre3.textColor = rouge
                ordre4.textColor = vert
                let equipe1 = Equipe(Nom: NEquipe1!, ordre: 2, numEquipe : 1);
                let equipe2 = Equipe(Nom: NEquipe2!, ordre: 3, numEquipe : 2);
                let equipe3 = Equipe(Nom: NEquipe3!, ordre: 4, numEquipe : 3);
                let equipe4 = Equipe(Nom: NEquipe4!, ordre: 1, numEquipe : 4);
                self.equipes.append(equipe1);
                self.equipes.append(equipe2);
                self.equipes.append(equipe3);
                self.equipes.append(equipe4);
                
            }
            self.ordre3.isHidden = false
            self.ordre4.isHidden = false
            break
            
        default:
            break
        }
        // Do any additional setup after loading the view.
        if(!self.equipes.isEmpty){
            self.partie = Partie(nbEquipe: NBEquipe, partieLongue: partieLongue, equipes: equipes)
        }else{
            print("Erreur creation partie")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDebutPartie"){
            if let destViewController = segue.destination as? JeuPlateauVC {
                destViewController.partie = self.partie;
            }
        }
    }
    
    
    
    
}
