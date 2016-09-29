//
//  Goal.swift
//  hockeyCosom
//
//  Created by Emard, Arthur on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import Foundation

class Goal{
    var Scrorer :Joueur;
    var Assit_1 :Joueur;
    var Assit_2 :Joueur;
    init(scrorer : Joueur,assit_1 : Joueur, assit_2 : Joueur){
        self.Scrorer = scrorer;
        self.Assit_1 = assit_1;
        self.Assit_2 = assit_2;
    }
    
    
}