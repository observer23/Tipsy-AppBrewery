//
//  ResultVC.swift
//  Tipsy
//
//  Created by Ekin Atasoy on 6.09.2022.

import UIKit

class ResultVC: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    var bill=Float()
    var person = Int()
    var tipRate = Float()
    var result=String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result = String(format: "%.2f", bill)
        totalLabel.text = "\(result)"
        
        settingsLabel.text = "Split between \(person), with \(Int(tipRate*100))% tip. "
        
        
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
