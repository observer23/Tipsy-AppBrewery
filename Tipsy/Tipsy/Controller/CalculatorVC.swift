//
//  ViewController.swift
//  Tipsy
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    var tip = 0.10
    var people = 2
    var totalAmount=0.0
    var billToPerson = 0.0
    

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithOutPct = String(buttonTitle.dropLast())
        let buttonTitleNumber=Double(buttonTitleWithOutPct)!
        tip = buttonTitleNumber/100
        
        billTextField.endEditing(true)
        
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        people = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let hesap = billTextField.text
        totalAmount = Double(hesap!)!
        
        totalAmount += totalAmount*tip
        billToPerson = totalAmount/Double(people)
        
        self.performSegue(withIdentifier: "toResult", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult"{
            let destinationVC = segue.destination as! ResultVC
            destinationVC.bill = Float(billToPerson)
            destinationVC.person = people
            destinationVC.tipRate = Float(tip)
        }
    }
}

