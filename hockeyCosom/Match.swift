//
//  Match.swift
//  hockeyCosom
//
//  Created by Frederic Fecteau on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Match{

    var Equipe1 = [Joueur]();
    var Equipe2 = [Joueur]();
    
    init ()
    {
        
    }
    
    func AddPlayerEquipe1(nomJoueur : String, numeroJoueur: Int) {
        let joueur:Joueur=Joueur(nom : nomJoueur, numero: numeroJoueur)
        Equipe1.append(joueur)
    }
    
    func AddPlayerEquipe2(nomJoueur : String, numeroJoueur: Int) {
        let joueur:Joueur=Joueur(nom : nomJoueur, numero: numeroJoueur)
        Equipe2.append(joueur)
    }
    
}

