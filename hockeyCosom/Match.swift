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
    
    func AddPlayerEquipe1(joueur : Joueur) {
        Equipe1.append(joueur)
    }
    
    func AddPlayerEquipe2(joueur : Joueur) {
        Equipe2.append(joueur)
    }
    
}

