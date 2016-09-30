//
//  Joueur.swift
//  hockeyCosom
//
//  Created by Emard, Arthur on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Joueur {
    
    private var Nom: String;
    private var Numero: Int;
    private var Id: Int;
    private var NumeroEquipe: Int;
    private var Goals = [Int]();
    private var Assist = [Int]();
    private var Assist_2 = [Int]();
    
    init(nom: String, numero: Int,  numeroEquipe: Int, id: Int){
        self.Nom = nom
        self.Numero = numero
        self.NumeroEquipe = numeroEquipe
        self.Id = id
    }
    internal func AddGoal(goalNumber : Int){
        self.Goals.append(goalNumber);
    }
    internal func AddAssist(assistNumber : Int){
        self.Assist.append(assistNumber);
    }
    internal func AddAssist_2(assistNumber : Int){
        self.Assist_2.append(assistNumber);
    }
    
    internal func GetTotalPoints() -> Int {
        return Goals.count + Assist.count + Assist_2.count;
    }
    
    internal func GetTotalGoals() -> Int {
        return Goals.count;
    }

    internal func GetTeam() -> Int {
        return NumeroEquipe;
    }
    
    internal func GetId() -> Int {
        return Id;
    }
    
}

