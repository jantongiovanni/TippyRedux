//
//  SettingsViewController.swift
//  TippyRedux
//
//  Created by JoesMac on 6/28/18.
//  Copyright © 2018 JoesMac. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var underView: UIView!
    @IBOutlet var settingView: UIView!
    @IBOutlet weak var themeDefault: UISegmentedControl!
    @IBOutlet weak var tipDefault: UISegmentedControl!
    var themeVal = 0
    var tipVal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tipPos = UserDefaults.standard.integer(forKey: "tip")
        let themePos = UserDefaults.standard.integer(forKey: "theme")
        
        themeDefault.selectedSegmentIndex = themePos
        tipDefault.selectedSegmentIndex = tipPos
        
        if themePos == 0{
            underView.setGradientBackground(colorOne: .orange, colorTwo: .yellow)}
        else{
            underView.setGradientBackground(colorOne: .purple, colorTwo: .black)}
    }
    
    @IBAction func setDefaults(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let tipPercentages = [0, 1, 2, 3]
        tipVal = tipPercentages[tipDefault.selectedSegmentIndex]
        defaults.set(tipVal, forKey: "tip")
        
        let themeArr = [0, 1]
        themeVal = themeArr[themeDefault.selectedSegmentIndex]
        defaults.set(themeVal, forKey: "theme")

        if themeVal == 0{
            underView.setGradientBackground(colorOne: .orange, colorTwo: .yellow)
        }
        else{
            underView.setGradientBackground(colorOne: .purple, colorTwo: .black)
        }
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
