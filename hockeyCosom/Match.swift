//
//  Match.swift
//  hockeyCosom
//
//  Created by Frederic Fecteau on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Match{

    var Joueurs = [Joueur]();
    
    //var Goals = [Goal]();
    
    init ()
    {
        
    }
//    func AddGoal(scrorer : Joueur,assit_1 : Joueur,assit_2 : Joueur) {
//        
//    }
    func AddPlayer(nomJoueur : String, numeroJoueur: Int,numeroEquipe: Int) {
        let joueur:Joueur=Joueur(nom : nomJoueur, numero: numeroJoueur, numeroEquipe : numeroEquipe);
        Joueurs.append(joueur);
    }
}

