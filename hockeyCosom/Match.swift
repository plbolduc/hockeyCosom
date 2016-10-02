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
    
    internal func GetStars(winningTeam : Int) ->  [Joueur]{
        let stars : Stars=Stars(joueurs : self.Joueurs);
        return stars.GetStars(winningTeam);
    }
    
    internal func GetJoeur(idJoueur : Int) ->  Joueur{
        return Joueurs[idJoueur];
    }
    
    internal func GetWinningTeam() ->  Int{
        var sum1 = GetTeamGoals(1);
        var sum2 = GetTeamGoals(2);
        
        if(sum1 > sum2){
            return 1;
        }else{
            return 2;
        }
        
    }
    
    internal func GetTeamGoals(teamId : Int) ->  Int{
        
        var sum = 0;
        for joueur in Joueurs{
            
            if(teamId == joueur.GetTeam()){
                sum += joueur.GetTotalGoals()
            }
            
        }
        return sum;
    }

    
}

