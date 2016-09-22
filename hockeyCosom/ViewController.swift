//
//  ViewController.swift
//  hockeyCosom
//
//  Created by Bolduc, Pierre-Luc on 16-09-22.
//  Copyright © 2016 Bolduc, Pierre-Luc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
    @IBOutlet weak var E1: UITextField!
    @IBOutlet weak var E2: UITextField!


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

