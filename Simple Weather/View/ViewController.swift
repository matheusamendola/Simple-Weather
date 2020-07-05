//
//  ViewController.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 05/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var Weather: UILabel!
    @IBOutlet weak var Phrase: UILabel!
    @IBOutlet weak var City: UILabel!
    
    
    @IBAction func SwipeAction(_ sender: Any) {
        performSegue(withIdentifier: "detalied", sender: nil)
    }
    

    override func viewDidLoad() {
        applyGradient()
        getWeather(city: "Vitoria", unit: "metric")
        super.viewDidLoad()
        
        //Gradiente

        

        
    }


}

