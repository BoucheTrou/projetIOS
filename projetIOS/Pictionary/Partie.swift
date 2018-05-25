//
//  Partie.swift
//  Pictionary
//
//  Created by Benjamin Trotin on 23/02/2017.
//  Copyright © 2017 Benjamin Trotin. All rights reserved.
//

import Foundation
let nbCasePartieLongue : Int = 55;
let nbCasePartieCourte : Int = 25;

class Partie{
    var nombreEquipe : Int;
    var nombreCase : Int;
    var partieLongue : Bool
    var Equipes : [Equipe] = []
    
    init(nbEquipe : Int, partieLongue : Bool, equipes : [Equipe] ) {
        self.nombreEquipe = nbEquipe
        self.partieLongue = partieLongue
        self.Equipes = equipes
        if(self.partieLongue){
            self.nombreCase = nbCasePartieLongue
        }
        else{
            self.nombreCase = nbCasePartieCourte
        }
        
    }
    convenience init() {
        self.init(nbEquipe : 0, partieLongue : true, equipes : [] );
    }
    
    func quiJoue(ordre : Int) -> Equipe {
        var i : Int = 0;
        var trouve : Bool = false;
        while(i < Equipes.count && !trouve){
            if(Equipes[i].getOrdre() == ordre){
                trouve = true;
            }else{
                i += 1;
            }
            
        }
        return (Equipes[i])
    }
    
    func chercheEquipe(num : Int) -> Equipe {
        var i : Int = 0;
        var trouve : Bool = false;
        while(i < Equipes.count && !trouve){
            if(Equipes[i].getNumEquipe() == num){
                trouve = true;
            }else{
                i += 1;
            }
            
        }
        return (Equipes[i])
    }
}
