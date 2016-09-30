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
    
    private func GetStar_1(winningTeam : Int) -> Joueur
    {
        var firstStar:Joueur=Joueur(nom : "", numero: 0, numeroEquipe : winningTeam,id : 0);
        var bestTotalPoints = 0;
        var bestTotalGoals = 0;
        for joueur in Joueurs
        {
            if(winningTeam == joueur.GetTeam())
            {
                if(bestTotalPoints < joueur.GetTotalPoints())
                {
                    firstStar = joueur;
                    bestTotalPoints = joueur.GetTotalPoints()
                    bestTotalGoals = joueur.GetTotalGoals()
                }
                else if(joueur.GetTotalPoints() == bestTotalPoints)
                {
                    if(joueur.GetTotalGoals() > bestTotalGoals)
                    {
                        firstStar = joueur;
                        bestTotalPoints = joueur.GetTotalPoints()
                        bestTotalGoals = joueur.GetTotalGoals()
                    }
                }
            }
        }
        return firstStar;
    }
    
    private func GetStar_2(firstStar : Joueur) -> Joueur
    {
        var secondStar:Joueur=Joueur(nom : "", numero: 0, numeroEquipe : 0,id : 0);
        var bestTotalPoints = 0;
        var bestTotalGoals = 0;
        for joueur in Joueurs
        {
            if(firstStar.Id != joueur.Id)
            {
                if(bestTotalPoints < joueur.GetTotalPoints())
                {
                    secondStar = joueur;
                    bestTotalPoints = joueur.GetTotalPoints()
                    bestTotalGoals = joueur.GetTotalGoals()
                }
                else if(joueur.GetTotalPoints() == bestTotalPoints)
                {
                    if(joueur.GetTotalGoals() > bestTotalGoals)
                    {
                        secondStar = joueur;
                        bestTotalPoints = joueur.GetTotalPoints()
                        bestTotalGoals = joueur.GetTotalGoals()
                    }
                }
            }
            
        }
        return secondStar;
    }
    
    internal func GetStars(winningTeam : Int) -> [Joueur]
    {
        let firstStar:Joueur = GetStar_1(winningTeam);
        let secondStar:Joueur = GetStar_2(firstStar);
        var thirdStar:Joueur=Joueur(nom : "", numero: 0, numeroEquipe : 0, id: 0);
        var bestTotalPoints = 0;
        var bestTotalGoals = 0;
        for joueur in Joueurs
        {
            if(firstStar.Id != joueur.Id && secondStar.Id != joueur.Id)
            {
                if(bestTotalPoints < joueur.GetTotalPoints())
                {
                    thirdStar = joueur;
                    bestTotalPoints = joueur.GetTotalPoints()
                    bestTotalGoals = joueur.GetTotalGoals()
                }
                else if(joueur.GetTotalPoints() == bestTotalPoints)
                {
                    if(joueur.GetTotalGoals() > bestTotalGoals)
                    {
                        thirdStar = joueur;
                        bestTotalPoints = joueur.GetTotalPoints()
                        bestTotalGoals = joueur.GetTotalGoals()
                    }
                }
            }
            
        }
        var treeStars = [Joueur]();
        treeStars.append(firstStar);
        treeStars.append(secondStar);
        treeStars.append(thirdStar);
        return treeStars;
    }
    
    
}