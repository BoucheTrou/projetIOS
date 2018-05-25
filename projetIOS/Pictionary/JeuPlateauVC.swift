//
//  JeuPlateauVC.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 23/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import UIKit

class JeuPlateauVC: UIViewController {
    @IBOutlet weak var BSuivant: UIButton!
    @IBOutlet weak var FinPartie: UILabel!
    @IBOutlet weak var CaseActuelle: UILabel!
    @IBOutlet weak var EquipeActuelle: UILabel!
    @IBOutlet weak var Dé: UIButton!
    @IBOutlet weak var BackgroundPlateau: UIImageView!
    @IBOutlet weak var Bleu: UIImageView!
    @IBOutlet weak var Rouge: UIImageView!
    @IBOutlet weak var Vert: UIImageView!
    @IBOutlet weak var Jaune: UIImageView!
    @IBOutlet weak var Victoire: UIButton!
    
    
    var partie : Partie = Partie();
    static var ordre : Int = 1;
    static var themeActuel : String = ""
    var passerAuSuivant : Bool = false;
    var trouve : Bool = false;
    var equipeQuiJoue : Equipe = Equipe()
    
    let scoreAcces : UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.equipeQuiJoue = self.partie.quiJoue(ordre: JeuPlateauVC.ordre) //Definie qui joue ce tour
        self.chargerDécor() //Charge le décor correspondant à la case où il se trouve
        self.chargerPion()
        
        if(passerAuSuivant){
            self.suivant();
        }
        else{
            if(self.equipeQuiJoue.getCaseActuelle() == 1 && !trouve){
                BackgroundPlateau.image = UIImage(named: "DesignPlateauDépart")
                
            }
            else{
                lancerDé();
            }
        }
        
        
        let equipeQuiJoue: Equipe = self.partie.quiJoue(ordre: JeuPlateauVC.ordre)
        self.FinPartie.text = "Arrivée dans \(String((partie.nombreCase)-equipeQuiJoue.getCaseActuelle())) Cases !"
        self.EquipeActuelle.text = equipeQuiJoue.getNom()
        self.CaseActuelle.text = String(equipeQuiJoue.getCaseActuelle())
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func suivant(){
        switch JeuPlateauVC.ordre{
            case 1 :
                JeuPlateauVC.ordre += 1;
                break;
            case 2 :
                if(partie.nombreEquipe == 2){
                    JeuPlateauVC.ordre = 1
                }
                else{
                    JeuPlateauVC.ordre += 1
                }
                break;
            case 3 :
                if(partie.nombreEquipe == 3){
                    JeuPlateauVC.ordre = 1
                }
                else{
                    JeuPlateauVC.ordre += 1
                }
                break;

            case 4 :
                JeuPlateauVC.ordre = 1
                break;

            default:break
        }
        self.equipeQuiJoue = self.partie.quiJoue(ordre: JeuPlateauVC.ordre)
        self.chargerDécor() //Charge le décor correspondant à la case où il se trouve
        self.chargerPion()
        
        
    }
    
    func lancerDé(){
        Dé.isHidden = false
    }
    
    func chargerDécor(){
        switch(equipeQuiJoue.getCouleurCaseActuelle()){
        case Equipe.CouleurCase.bleu :
            BackgroundPlateau.image = UIImage(named: "DesignPlateauBleu")
            JeuPlateauVC.themeActuel = "ThemeBleu".localized(lang: ViewController.lang)
            break;
        case Equipe.CouleurCase.rouge :
            BackgroundPlateau.image = UIImage(named: "DesignPlateauRouge")
            JeuPlateauVC.themeActuel = "ThemeRouge".localized(lang: ViewController.lang)
            break;
        case Equipe.CouleurCase.vert :
            BackgroundPlateau.image = UIImage(named: "DesignPlateauVert")
            JeuPlateauVC.themeActuel = "ThemeVert".localized(lang: ViewController.lang)
            break;
        case Equipe.CouleurCase.jaune :
            if(equipeQuiJoue.getCaseActuelle() == 1){
                BackgroundPlateau.image = UIImage(named: "DesignPlateauDépart")
                JeuPlateauVC.themeActuel = "ThemeJaune".localized(lang: ViewController.lang)
            }
            else{
                BackgroundPlateau.image = UIImage(named: "DesignPlateauJaune")
                JeuPlateauVC.themeActuel = "ThemeJaune".localized(lang: ViewController.lang)
            }
            break;
        case Equipe.CouleurCase.orange :
            BackgroundPlateau.image = UIImage(named: "DesignPlateauOrange")
            JeuPlateauVC.themeActuel = "ThemeOrange".localized(lang: ViewController.lang)
            break;
        }
        print(JeuPlateauVC.themeActuel)
    }
    
    func chargerPion(){
        print(equipeQuiJoue.getNumEquipe())
        self.resetPion()
        switch partie.nombreEquipe {
        case 2:
            let Equipe1 : Equipe = partie.chercheEquipe(num: 1)
            let Equipe2 : Equipe = partie.chercheEquipe(num: 2)
            
            switch equipeQuiJoue.getNumEquipe() {
                
            case 1:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                Bleu.isHidden = false
                Bleu.image = UIImage(named: "BleuS")
                break;
            case 2:
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                Rouge.isHidden = false
                Rouge.image = UIImage(named: "RougeS")
                break;
            default:break;
            }
        case 3:
            let Equipe1 : Equipe = partie.chercheEquipe(num: 1)
            let Equipe2 : Equipe = partie.chercheEquipe(num: 2)
            let Equipe3 : Equipe = partie.chercheEquipe(num: 3)
            
            switch equipeQuiJoue.getNumEquipe() {
                
            case 1:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                self.autrePionCase(equipe: Equipe3, pion: Vert, couleur: "VertD")
                Bleu.isHidden = false
                Bleu.image = UIImage(named: "BleuS")
                break;
            case 2:
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                self.autrePionCase(equipe: Equipe3, pion: Vert, couleur: "VertD")
                Rouge.isHidden = false
                Rouge.image = UIImage(named: "RougeS")
                break;
            case 3:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                Vert.isHidden = false
                Vert.image = UIImage(named: "VertS")
                break;
            default:break;
            }
        case 4:
            let Equipe1 : Equipe = partie.chercheEquipe(num: 1)
            let Equipe2 : Equipe = partie.chercheEquipe(num: 2)
            let Equipe3 : Equipe = partie.chercheEquipe(num: 3)
            let Equipe4 : Equipe = partie.chercheEquipe(num: 4)
            
            switch equipeQuiJoue.getNumEquipe() {
        
            case 1:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                self.autrePionCase(equipe: Equipe3, pion: Vert, couleur: "VertD")
                self.autrePionCase(equipe: Equipe4, pion: Jaune, couleur: "JauneD")
                Bleu.isHidden = false
                Bleu.image = UIImage(named: "BleuS")
                break;
            case 2:
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                self.autrePionCase(equipe: Equipe3, pion: Vert, couleur: "VertD")
                self.autrePionCase(equipe: Equipe4, pion: Jaune, couleur: "JauneD")
                Rouge.isHidden = false
                Rouge.image = UIImage(named: "RougeS")
                break;
            case 3:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                self.autrePionCase(equipe: Equipe4, pion: Jaune, couleur: "JauneD")
                Vert.isHidden = false
                Vert.image = UIImage(named: "VertS")
            break;
            case 4:
                self.autrePionCase(equipe: Equipe2, pion: Rouge, couleur: "RougeD")
                self.autrePionCase(equipe: Equipe3, pion: Vert, couleur: "VertD")
                self.autrePionCase(equipe: Equipe1, pion: Bleu, couleur: "BleuD")
                Jaune.isHidden = false
                Jaune.image = UIImage(named: "JauneS")
                break;
            default:
                break;
        }
        default:
            break
        }
        
    }
    
    func autrePionCase(equipe: Equipe, pion : UIImageView, couleur : String){
        pion.isHidden = (equipe.getCaseActuelle() == equipeQuiJoue.getCaseActuelle()) ? false : true
        if(!pion.isHidden){ pion.image = UIImage(named: couleur) }
        
    }
    
    func resetPion(){
        Bleu.isHidden = true
        Rouge.isHidden = true
        Vert.isHidden = true
        Jaune.isHidden = true
    }
    
    @IBAction func resultatLancéDé(_ sender: Any) {
        let res : Int = Int(arc4random_uniform(UInt32(5)))+1
        self.equipeQuiJoue.setCaseActuelle(nb: self.equipeQuiJoue.getCaseActuelle()+res)
        Dé.isHidden = true
        if((partie.nombreCase)-equipeQuiJoue.getCaseActuelle() <= 0){
            
        }
        victoire()
        self.FinPartie.text = "Arrivée dans \(String((partie.nombreCase)-equipeQuiJoue.getCaseActuelle())) Cases !"
        self.EquipeActuelle.text = equipeQuiJoue.getNom()
        self.CaseActuelle.text = String(equipeQuiJoue.getCaseActuelle())
        self.chargerDécor()
        self.chargerPion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueVoirMot"){
            if let destViewController = segue.destination as? AffichageMotVC {
                destViewController.partie = self.partie;
            }
        }
        
        if(segue.identifier == "FinPartie"){
            if let destViewController = segue.destination as? ViewController {
                destViewController.jouerUneFois = true;
            }
        }
    }
    
    func victoire(){
        if(self.equipeQuiJoue.getCaseActuelle() > self.partie.nombreCase){
            switch self.equipeQuiJoue.getNumEquipe(){
            case 1: Victoire.setImage(UIImage(named: "VictoireBleu".localized(lang: ViewController.lang)), for: UIControlState.normal)
            case 2: Victoire.setImage(UIImage(named: "VictoireRouge".localized(lang: ViewController.lang)), for: UIControlState.normal)
            case 3: Victoire.setImage(UIImage(named: "VictoireVert".localized(lang: ViewController.lang)), for: UIControlState.normal)
            case 4: Victoire.setImage(UIImage(named: "VictoireJaune".localized(lang: ViewController.lang)), for: UIControlState.normal)
            default:break;
            }
            Victoire.isHidden = false
        }
    }
    
    func classerEquipe( tabE : [Equipe]) -> [Equipe]{
        var tab = tabE
        var tmp : Equipe = Equipe();
        for i in 0...tab.count-2{
            for j in i+1...tab.count-1{
                if(tab[i].getCaseActuelle() < tab[j].getCaseActuelle())
                {
                    tmp = tab[i];
                    tab[i] = tab[j];
                    tab[j] = tmp;
                }
            }
        }
        return tab
    }
    
    @IBAction func EnregistrerScore(_ sender: Any) {
        var equipeTrié : [Equipe] = []
        equipeTrié = classerEquipe(tabE: partie.Equipes)
        scoreAcces.set(equipeTrié[0].getNom(), forKey:"premier")
        scoreAcces.set(equipeTrié[1].getNom(), forKey:"deuxieme")
        switch equipeTrié.count{
        case 3 :
            scoreAcces.set(equipeTrié[2].getNom(), forKey:"troisieme")
            
            break;
            
        case 4 :
            scoreAcces.set(equipeTrié[3].getNom(), forKey:"quatrieme")
            break;  
        default:break
        }
        scoreAcces.set(equipeTrié.count,forKey: "NbEquipes")
        
        
    }

}
