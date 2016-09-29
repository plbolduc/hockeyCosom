//
//  Etoile.swift
//  hockeyCosom
//
//  Created by Frederic Fecteau on 16-09-29.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Stars{
    var Joueurs = [Joueur]();
    
    init(Joueurs : [Joueur]){
        self.Joueurs = Joueurs;
    }
    
    func GetStar_1(winningTeam : Int) -> Joueur {
        var firstStar:Joueur=Joueur(nom : "", numero: 0, numeroEquipe : winningTeam);
        var TotalPoints = 0;
        for joueur in Joueurs
        {
            if(winningTeam == joueur.GetTeam())
            {
                if(TotalPoints < joueur.GetTotalPoints())
                {
                    firstStar = joueur;
                }
            }
            
            TotalPoints = joueur.GetTotalPoints()
        }
        return firstStar;
    }
        
        

}