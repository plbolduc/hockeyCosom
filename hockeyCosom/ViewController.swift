//
//  ViewController.swift
//  hockeyCosom
//
//  Created by Bolduc, Pierre-Luc on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stepper: UIStepper!
    @IBOutlet var periode: UITextField!
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

}

