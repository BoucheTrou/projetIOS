//
//  Pion.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 22/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import Foundation


class Equipe{
    enum CouleurCase : String{
        case jaune, bleu, orange, vert, rouge
    }
    
    private var NomEquipe : String;
    private var CaseActuelle : Int;
    private var CouleurCaseActuelle : CouleurCase;
    private var Ordre : Int;
    private var NumEquipe : Int;
    
    
    init(Nom : String, ordre : Int, numEquipe : Int){
        self.NomEquipe = Nom;
        self.CaseActuelle = 1;
        self.CouleurCaseActuelle = .jaune
        self.Ordre = ordre;
        self.NumEquipe = numEquipe
    }
    
    convenience init() {
        self.init(Nom : "", ordre : 0, numEquipe : 0);
    }
    
    func deplacement(Nb : Int) {
        if(Nb < 0){
            print("Erreur")
        }
        self.CaseActuelle += Nb
    }
    
    func getCouleurCaseActuelle() -> CouleurCase{
        
        let NbCouleurCase : Int = self.CaseActuelle % 5
        
        switch NbCouleurCase {
        case 0:
            self.CouleurCaseActuelle = .rouge; break;
        case 1:
            self.CouleurCaseActuelle = .jaune; break;
        case 2:
            self.CouleurCaseActuelle = .bleu; break;
        case 3:
            self.CouleurCaseActuelle = .orange; break;
        case 4:
            self.CouleurCaseActuelle = .vert; break;
        default:break;
        }
        return self.CouleurCaseActuelle
    }
    
    func memeCase(numCase : Int) -> Bool{
        if(self.CaseActuelle == numCase){
            return true
        }
        else{
           return false 
        }
    }
    
    func setCaseActuelle(nb : Int){
        self.CaseActuelle = nb
    }
    
    func getOrdre() -> Int{
        return self.Ordre;
    }
    
    func getCaseActuelle() -> Int{
        return self.CaseActuelle;
    }
    
    func getNom() -> String{
        return self.NomEquipe;
    }
    
    func getNumEquipe() -> Int{
        return self.NumEquipe;
    }
    
}
