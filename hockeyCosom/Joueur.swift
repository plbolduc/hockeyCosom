//
//  Joueur.swift
//  hockeyCosom
//
//  Created by Emard, Arthur on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Joueur {
    var nom: String;
    var numero: Int;
    var numeroEquipe: Int;
    var goals = [Int]();
    var Assist = [Int]();
    var Assist_2 = [Int]();
    
    init(nom: String, numero: Int,  numeroEquipe: Int){
        self.nom = nom
        self.numero = numero
        self.numeroEquipe = numeroEquipe
    }
    func AddGoal(goalNumber : Int){
        self.goals.append(goalNumber);
    }
    func AddAssist(assistNumber : Int){
        self.Assist.append(assistNumber);
    }
    func AddAssist_2(assistNumber : Int){
        self.Assist_2.append(assistNumber);
    }
    
    func GetTotalPoints() -> Int {
        return goals.count + Assist.count + Assist_2.count;
    }

    func GetTeam() -> Int {
        return numeroEquipe;
    }
    
}

