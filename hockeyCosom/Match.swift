//
//  Match.swift
//  hockeyCosom
//
//  Created by Frederic Fecteau on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Match{

    private var Joueurs = [Joueur]();
    
    init ()
    {
        
    }

    internal func AddPlayer(nomJoueur : String, numeroJoueur: Int,numeroEquipe: Int, id : Int) {
        
        let joueur:Joueur=Joueur(nom : nomJoueur, numero: numeroJoueur, numeroEquipe : numeroEquipe,id : id);
        Joueurs.append(joueur);
    }
    
    internal func GetStars() {
        
        
    }
    
    
}

