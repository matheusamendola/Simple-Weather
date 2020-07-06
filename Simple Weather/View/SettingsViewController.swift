//
//  SettingsViewController.swift
//  Simple Weather
//
//  Created by Matheus Amendola on 06/07/20.
//  Copyright © 2020 Matheus Amendola. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scMetrical: UISegmentedControl!
    
    var config = configuration.shared
    
    @IBAction func changeMetrical(_ sender: UISegmentedControl) {
        config.metric = sender.selectedSegmentIndex
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        formatView()
    }
    func formatView(){
        scMetrical.selectedSegmentIndex = config.metric
    }
    
}
