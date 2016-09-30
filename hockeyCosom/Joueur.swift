//
//  Joueur.swift
//  hockeyCosom
//
//  Created by Emard, Arthur on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Joueur {
    
    var Nom: String;
    var Numero: Int;
    var Id: Int;
    var NumeroEquipe: Int;
    var Goals = [Int]();
    var Assist = [Int]();
    var Assist_2 = [Int]();
    
    init(nom: String, numero: Int,  numeroEquipe: Int, id: Int){
        self.Nom = nom
        self.Numero = numero
        self.NumeroEquipe = numeroEquipe
        self.Id = id
    }
    func AddGoal(goalNumber : Int){
        self.Goals.append(goalNumber);
    }
    func AddAssist(assistNumber : Int){
        self.Assist.append(assistNumber);
    }
    func AddAssist_2(assistNumber : Int){
        self.Assist_2.append(assistNumber);
    }
    
    func GetTotalPoints() -> Int {
        return Goals.count + Assist.count + Assist_2.count;
    }
    
    func GetTotalGoals() -> Int {
        return Goals.count;
    }

    func GetTeam() -> Int {
        return NumeroEquipe;
    }
    
}

