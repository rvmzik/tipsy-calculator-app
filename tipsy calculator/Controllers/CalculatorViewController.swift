//
//  ViewController.swift
//  tipsy calculator
//
//  Created by Рамазан Алиев on 26.09.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tips : Float = 0.0
    var labelSplit = "0.0"
    var textTotal = 123.56
    var totalValue = 0.0
    var finalResult = "0.0"
    
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var stepperOut: UIStepper!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        let buttonLabelText = sender.currentTitle ?? "something"
        let buttonTitleWithoutLast = buttonLabelText.dropLast()
        tips = Float(buttonTitleWithoutLast)! / 100
    }
    

    
    @IBAction func TextFieldPressed(_ sender: UITextField) {
        textTotal = Double(billTextField.text!) ?? 56.56
    }
    
    
    @IBAction func stepperValueVhanged(_ sender: UIStepper) {
        stepperOut.autorepeat = true
        stepperOut.minimumValue = 0
        stepperOut.maximumValue = 12
        splitNumberLabel.text = String(Int(sender.value))
        //splitNumberLabel.text = String(format: "%.0f", sender.value)
        labelSplit = splitNumberLabel.text ?? "Nothing"
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tips)
        print(labelSplit)
        totalValue = (textTotal * (1 + Double(tips))) / Double(labelSplit)!
        finalResult = String(format: "%.1f", totalValue)
        print(totalValue)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totalResult = finalResult
            destinationVC.labelBelow = "Split between \(labelSplit) people, with \(tips)% tip."
        }
    }
}

