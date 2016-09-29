//
//  ViewController.swift
//  hockeyCosom
//
//  Created by Bolduc, Pierre-Luc on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnBut: UIButton!
    @IBOutlet weak var btnPasse: UIButton!
    @IBOutlet weak var btnConfirmer: UIButton!
    @IBOutlet weak var btnStopStartGame: UIButton!
    
    
    @IBOutlet weak var E1: UITextField!
    @IBOutlet weak var E2: UITextField!

    @IBOutlet weak var N1E1: UITextField!
    @IBOutlet weak var N2E1: UITextField!
    @IBOutlet weak var N3E1: UITextField!
    @IBOutlet weak var N4E1: UITextField!
    @IBOutlet weak var N5E1: UITextField!
    @IBOutlet weak var N1E2: UITextField!
    @IBOutlet weak var N2E2: UITextField!
    @IBOutlet weak var N3E2: UITextField!
    @IBOutlet weak var N4E2: UITextField!
    @IBOutlet weak var N5E2: UITextField!
    
    
    @IBOutlet weak var J1E1: UITextField!
    @IBOutlet weak var J2E1: UITextField!
    @IBOutlet weak var J3E1: UITextField!
    @IBOutlet weak var J4E1: UITextField!
    @IBOutlet weak var J5E1: UITextField!
    @IBOutlet weak var J1E2: UITextField!
    @IBOutlet weak var J2E2: UITextField!
    @IBOutlet weak var J3E2: UITextField!
    @IBOutlet weak var J4E2: UITextField!
    @IBOutlet weak var J5E2: UITextField!

    @IBOutlet var stepper: UIStepper!
    @IBOutlet var periode: UITextField!
    var gameTimeMode = false; //true = time is running  false = time is not runningß
   
    @IBOutlet weak var timerOnOffText: UIButton!
    @IBAction func TimerOnOffEvent(sender: UIButton) {
  
            if(self.gameTimeMode == true){
                self.timerOnOffText.setTitle("Off", forState: .Normal);
                self.gameTimeMode = false;
            }else{
                self.timerOnOffText.setTitle("On", forState: .Normal);
                self.gameTimeMode = true;
            }
        
    }

    var match = Match()
    var gameMode = 1; //1 = start game; 2 = stop game
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.maximumValue = 3
        stepper.minimumValue = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changePeriode(sender: UIStepper) {
        self.periode.text = Int(sender.value).description
    }
    
    @IBAction func startGame(sender: UIButton) {
        
        //start the game
        if(gameMode == 1){
        match = Match()
        let team1Players:[UITextField] = [J1E1, J2E1, J3E1, J4E1, J5E1];
        let team1Numbers:[UITextField] = [N1E1, N2E1, N3E1, N4E1, N5E1];
        let team2Players:[UITextField] = [J1E2, J2E2, J3E2, J4E2, J5E2];
        let team2Numbers:[UITextField] = [N1E2, N2E2, N3E2, N4E2, N5E2];
        
        if(createGame(team1Players, teamNumbers: team1Numbers,team: 1) && createGame(team2Players, teamNumbers: team2Numbers,team : 2)){
            disEnaInputs();

        }else{
            let alert = UIAlertController(title: "Erreur", message: "Vous devez remplir tous les champs!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
        }
        }else{ //end game
            
        }
    }
    
    func disEnaInputs(){
        let disableField:[UITextField] = [J1E1, J2E1, J3E1, J4E1, J5E1, N1E1, N2E1, N3E1, N4E1, N5E1,J1E2, J2E2, J3E2, J4E2, J5E2,N1E2, N2E2, N3E2, N4E2, N5E2, E1, E2];
        
        for input in disableField {
            input.enabled = false;
        }
        
        stepper.enabled = true;
        btnBut.enabled = true;
        btnPasse.enabled = true;
        btnConfirmer.enabled = true;
        
        btnStopStartGame.setTitle("Terminer la partie", forState: UIControlState.Normal);
    }
    
    func createGame(teamPlayers:[UITextField], teamNumbers:[UITextField], team : Int) -> Bool {
        var validInputs = true;
        var indexJoueur = 0;
        for player in teamPlayers {
            if(!player.hasText() && !teamNumbers[indexJoueur].hasText()){
                validInputs = false;
            }
            
            if(validInputs)
            {
                let teamNumber = Int(teamNumbers[indexJoueur].text!)
                match.AddPlayer(player.text!, numeroJoueur : teamNumber!,equipe: team)
            }
            indexJoueur += 1;
        }
        return validInputs
    }
}

