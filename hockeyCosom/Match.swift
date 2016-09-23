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
    
    func AddPlayer(nomJoueur : String, numeroJoueur: Int,equipe: Int) {
        let joueur:Joueur=Joueur(nom : nomJoueur, numero: numeroJoueur)
        if(equipe==1)
        {
            Equipe1.append(joueur)
        }
        if(equipe==2)
        {
            Equipe2.append(joueur)
        }
    }
}

