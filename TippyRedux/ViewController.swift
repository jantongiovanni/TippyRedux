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
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var customField: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        let tipPos = UserDefaults.standard.integer(forKey: "tip")
        let themePos = UserDefaults.standard.integer(forKey: "theme")
        tipControl.selectedSegmentIndex = tipPos
        
        if themePos == 0{
            mainView.setGradientBackground(colorOne: .orange, colorTwo: .yellow)
            UITextField.appearance().keyboardAppearance = .light
            print("light")

        }
        else{
            mainView.setGradientBackground(colorOne: .purple, colorTwo: .black)
            UITextField.appearance().keyboardAppearance = .dark
            print("dark")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customField.isHidden = true
        self.billField.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func segmentTap(_ sender: Any) {
        let getIndex = tipControl.selectedSegmentIndex
        switch(getIndex){
        case 0:
            customField.isHidden = true
        case 1:
            customField.isHidden = true
        case 2:
            customField.isHidden = true
        case 3:
            customField.isHidden = false
        default:
            customField.isHidden = true
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let customTip = Double(customField.text!) ?? 0
        let tipPercentages = [0.1, 0.15, 0.2, customTip]
       
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

