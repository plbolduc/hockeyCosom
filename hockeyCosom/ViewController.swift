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
    @IBOutlet weak var E1P: UILabel!
    @IBOutlet weak var E2P: UILabel!
    
    
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
    
    @IBOutlet weak var actionGameText: UITextView!
    
    
 
    
    @IBOutlet weak var L1E1: UILabel!
    @IBOutlet weak var L2E1: UILabel!
    @IBOutlet weak var L3E1: UILabel!
    @IBOutlet weak var L4E1: UILabel!
    @IBOutlet weak var L5E1: UILabel!
    
    @IBOutlet weak var L1E2: UILabel!
    @IBOutlet weak var L2E2: UILabel!
    @IBOutlet weak var L3E2: UILabel!
    @IBOutlet weak var L4E2: UILabel!
    @IBOutlet weak var L5E2: UILabel!
   
    
    
    var match = Match()
    var gameMode = 1; //1 = start game; 2 = stop game
    var selectedPlayerMode = 1; // 1 = but; 2 = passe
    
    var team1PlayersLabel:[UILabel] = [];
    var team2PlayersLabel:[UILabel] = [];
    
    var butCourant:[UILabel] = [];
    var passeCourantes:[UILabel] = [];
    
    var butid = 0;
    
    var gameTimeMode = false; //true = time is running  false = time is not runningß
    @IBOutlet weak var timerOnOffText: UIButton!
     @IBOutlet weak var TimerPeriode: UILabel!
    
    var timer = NSTimer();
   
    var minPerPeriode = 10;
    var minuteCpt = 10;
    var secondPerMin = 60;
    var secondCpt = 0;
    override func viewDidLoad() {
        self.gameTimeMode = false;
        
        E1.text = "Equipe1";
        E2.text = "Equipe2";
        team1PlayersLabel = [L1E1,L2E1,L3E1,L4E1,L5E1];
        team2PlayersLabel = [L1E2,L2E2,L3E2,L4E2,L5E2];
        
        super.viewDidLoad()
        stepper.maximumValue = 3
        stepper.minimumValue = 1
        
        for input in team1PlayersLabel {
            let eventClick = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectPlayers))
            input.addGestureRecognizer(eventClick);
            
           
        }
        for input in team2PlayersLabel {
            let eventClick = UITapGestureRecognizer(target: self, action: #selector(ViewController.selectPlayers))
            input.addGestureRecognizer(eventClick);
        }
        
    }
    
    @IBAction func TimerOnOffEvent(sender: UIButton) {
        if(self.gameTimeMode == false){
            self.timerOnOffText.setTitle("stop", forState: .Normal);
            self.gameTimeMode = true;
            self.timer.invalidate();
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("OnTimerTick"), userInfo: nil, repeats: true)
            
        }else{
            self.timerOnOffText.setTitle("start", forState: .Normal);
            self.gameTimeMode = false;
            self.timer.invalidate();
        }
        
    }
    func OnTimerTick() {
        self.secondCpt -= 1;
        
        if(self.secondCpt < 0 ){
            self.secondCpt = self.secondPerMin - 1;
            self.minuteCpt -= 1;
        }
        if(self.minuteCpt < 0){
            self.minuteCpt = self.minPerPeriode;
            self.secondCpt = 0;
            
            self.timerOnOffText.setTitle("Start", forState: .Normal);
            self.gameTimeMode = false;
            self.timer.invalidate();
            
            let alert = UIAlertController(title: "End of periode", message: "End of periode" + String(self.periode.text), preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            
        }
        if(self.secondCpt < 10){
            self.TimerPeriode.text = String(self.minuteCpt) + ":" + "0"+String(self.secondCpt);

        }else{
            self.TimerPeriode.text = String(self.minuteCpt) + ":" + String(self.secondCpt);

        }
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectPlayers(sender:UITapGestureRecognizer) {
        
        if(gameMode == 1){
            return;
        }
        let labelplayer:UILabel = (sender.view as! UILabel) // Type cast it with the class for which you have added gesture
        
        if(selectedPlayerMode == 1){
            if(butCourant.count == 0){
                butCourant.append(labelplayer);
                labelplayer.backgroundColor =  UIColor(red: 5/255, green: 153/255, blue: 56/255, alpha: 1.0);
            }else{
                let alert = UIAlertController(title: "Nombre de but", message: "La limite de 1 but est atteint", preferredStyle: UIAlertControllerStyle.Alert);
                alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                self.presentViewController(alert, animated: true, completion: nil);
            }
        }else if(selectedPlayerMode == 2){
            if(passeCourantes.count <= 1){
                for passeCourante in passeCourantes{
                    if(passeCourante == labelplayer){
                        let alert = UIAlertController(title: "Ajout invalide", message: "Cette personne est déjà selectionnée!", preferredStyle: UIAlertControllerStyle.Alert);
                        alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                        self.presentViewController(alert, animated: true, completion: nil);
                        return;
                    }
                }
                
                if(butCourant.count != 0 && butCourant[0] == labelplayer){
                    let alert = UIAlertController(title: "Ajout invalide", message: "Cette personne est déjà selectionnée!", preferredStyle: UIAlertControllerStyle.Alert);
                    alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                    self.presentViewController(alert, animated: true, completion: nil);
                    return;
                }
                
                
                passeCourantes.append(labelplayer)
                labelplayer.backgroundColor =  UIColor(red: 197/255, green: 0/255, blue: 0/255, alpha: 1.0);
            }else{
                let alert = UIAlertController(title: "Nombre de passe", message: "La limite de 2 passes est atteinte", preferredStyle: UIAlertControllerStyle.Alert);
                alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                self.presentViewController(alert, animated: true, completion: nil);
            }
        }
        
        //(sender.view)?.tag
    }
    
    func initalizePlayersLabels(playersLabel:[UILabel]){
        
        for input in playersLabel {
            input.backgroundColor =  UIColor(red: 197/255, green: 0/255, blue: 0/255, alpha: 0);
        }
    }
    
    @IBAction func confirmerBut(sender: UIButton) {
        
        /*var butCourant:[UILabel] = [];
         var passeCourantes:[UILabel] = [];
         */
        //let t = butCourant[0].valueForKey("teamid");
        if(butCourant.count == 0){
            let alert = UIAlertController(title: "But invalide", message: "Selectionner le joueur qui vient de faire le but!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
            
            return;
        }
        var idplayer = -1;
        
        var idplayerbut = -1;
        var idplayerpasse:[Int] = [];
        
        var stringNomBut = "";
        var stringNomPasse = "";
        
        var valid = true;
        
        for input in team1PlayersLabel {
            idplayer += 1;
            if(butCourant[0] == input){
                idplayerbut = idplayer;
            }
            
            for input2 in passeCourantes{
                
                if(input2 == input){
                    idplayerpasse.append(idplayer);
                }
            }
        }
        
        if(idplayerpasse.count > 0 && idplayerbut == -1){
            valid = false;
        }
        
        for input in team2PlayersLabel {
            idplayer += 1;
            if(butCourant[0] == input && idplayerbut == -1){
                idplayerbut = idplayer;
            }else if(butCourant[0] == input){
                valid = false;
            }
            
            for input2 in passeCourantes{
                if(input2 == input){
                    for currplayer in idplayerpasse{
                        if(currplayer <= 4){
                            valid = false;
                        }
                    }
                    if(idplayerbut <= 4){
                        valid = false;
                    }
                    idplayerpasse.append(idplayer);
                }
            }
        }
        
        if(valid && idplayerbut != -1){
            match.GetJoeur(idplayerbut).AddGoal(butid);
            var passCount = 1;
            for idpasse in idplayerpasse{
                
                if(passCount == 1){
                    stringNomPasse = " Assist : #"+String(match.GetJoeur(idpasse).GetNumero()) + " "+match.GetJoeur(idpasse).GetNom();
                    match.GetJoeur(idpasse).AddAssist(butid);
                }else{
                    stringNomPasse += ", #"+String(match.GetJoeur(idpasse).GetNumero()) + " "+match.GetJoeur(idpasse).GetNom();
                    match.GetJoeur(idpasse).AddAssist_2(butid);
                }
                passCount += 1;
            }
            butid += 1;
            
            if(idplayerbut >= 5){
                stringNomBut = E2.text!;
            }else{
                stringNomBut = E1.text!;
            }
            
            stringNomBut += " Periode #" + periode.text! + " But : #" + String(match.GetJoeur(idplayerbut).GetNumero()) + " " + match.GetJoeur(idplayerbut).GetNom()
            
            actionGameText.text = actionGameText.text + stringNomBut + stringNomPasse + "\n"
            E1P.text = String(match.GetTeamGoals(1));
            E2P.text = String(match.GetTeamGoals(2));
            btnBut.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
            btnPasse.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        }else{
            let alert = UIAlertController(title: "But invalide", message: "Les joueurs doivent tous faire partie de la même équipe!", preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
        }
        
        
    }
    
    @IBAction func butClick(sender: UIButton) {
        initalizePlayersLabels(butCourant);
        butCourant.removeAll(keepCapacity: false);
        selectedPlayerMode = 1;
    }
    @IBAction func passeClick(sender: UIButton) {
        initalizePlayersLabels(passeCourantes);
        passeCourantes.removeAll(keepCapacity: false);
        selectedPlayerMode = 2;
    }
    
    
    @IBAction func changePeriode(sender: UIStepper) {
        self.periode.text = Int(sender.value).description
    }
    
    
    @IBOutlet weak var boutonFred: UIButton!
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
                gameMode = 2;
                
            }else{
                let alert = UIAlertController(title: "Erreur", message: "Vous devez remplir tous les champs!", preferredStyle: UIAlertControllerStyle.Alert);
                alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                self.presentViewController(alert, animated: true, completion: nil);
            }
        }else{ //end game
            
            if(match.GetTeamGoals(1) ==  match.GetTeamGoals(2)){
                let alert = UIAlertController(title: "Match null", message: "Il est impossible de terminer un match null.", preferredStyle: UIAlertControllerStyle.Alert);
                alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
                self.presentViewController(alert, animated: true, completion: nil);
                return;
            }
            var joueursEtoiles = match.GetStars(match.GetWinningTeam());
            
            var str : String = "";
            var cpt = 1;
            for joueur in joueursEtoiles{
                
                str += String(cpt) + " - #" + String(joueur.GetNumero()) + " " + joueur.GetNom()+" " + String(joueur.GetTotalPoints()) + "Pts \n";
                cpt += 1;
            }
            
            let alert = UIAlertController(title: "*Joueurs étoiles*", message: str, preferredStyle: UIAlertControllerStyle.Alert);
            alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.Default, handler: nil));
            self.presentViewController(alert, animated: true, completion: nil);
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
        var cpt = 1;
        for player in teamPlayers {
            //player.text = "Salut";
            //teamNumbers[indexJoueur].text = String(cpt*team);
            if(!player.hasText() || !teamNumbers[indexJoueur].hasText()){
                validInputs = false;
            }
            
            if(validInputs)
            {
                do {
                    let teamNumber = Int(teamNumbers[indexJoueur].text!)
                    match.AddPlayer(player.text!, numeroJoueur : teamNumber!,numeroEquipe: team,id : cpt)
                } catch {
                    validInputs = false;
                    print("Something went wrong!")
                }
                
            }
            indexJoueur += 1;
            cpt += 1;
        }
        return validInputs
    }
    
    /*func addActionGamePlay(periode : Int, team : Int, buteur : String, passeurs : [String] ) {
     print("TITI")
     actionGameText.text = actionGameText.text + "But de " + team
     }*/
}

