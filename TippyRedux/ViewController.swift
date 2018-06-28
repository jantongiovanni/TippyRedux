
//
//  ViewController.swift
//  TippyRedux
//
//  Created by JoesMac on 6/28/18.
//  Copyright © 2018 JoesMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.setGradientBackground(colorOne: .black, colorTwo: .purple)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * 0.2
        let total = bill + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    }
}

