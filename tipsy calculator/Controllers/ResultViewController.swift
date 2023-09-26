//
//  ResultViewController.swift
//  tipsy calculator
//
//  Created by Рамазан Алиев on 26.09.2023.
//

import UIKit

class ResultViewController: UIViewController {

    var totalResult = "0.0"
    var labelBelow = "Text"
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalResult
        settingsLabel.text = labelBelow
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
