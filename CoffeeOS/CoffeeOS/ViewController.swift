//
//  ViewController.swift
//  CoffeeOS
//
//  Created by Michael Nino Evensen on 30/04/16.
//  Copyright © 2016 no.michaelevensen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cupsOfCoffeeValue: UILabel!
    
    @IBOutlet weak var equalsValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func changeCupsValue(sender: UIStepper) {
    
        let cupsAmount = sender.value
        
        cupsOfCoffeeValue.text = String(Int(sender.value))
        
        // equals
        let equals = cupsAmount * 10.6
        
        equalsValue.text = String(equals) + "gr"
        
    }


   
}

