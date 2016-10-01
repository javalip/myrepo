//
//  ViewController.swift
//  tippi
//
//  Created by Preeti  on 9/29/16.
//  Copyright © 2016 preeti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalAmount: UILabel!
    @IBOutlet var tipAmount: UILabel!
    @IBOutlet var billAmount: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    let tipArray = [0.18,0.20,0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultTip()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        //Calculate final amount
        let tipPercent = tipArray[tipControl.selectedSegmentIndex]
        let bill = Double(billAmount.text!)
        let tip = bill! * tipPercent
        let total = bill! + tip
        
        tipAmount.text = "\(tip)"
        totalAmount.text =  "\(total)"

    }
    
    func setDefaultTip(){
        // Read default tip from local storage. If local storage is empty then take default from story board.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("tipIndex")
        tipControl.selectedSegmentIndex = defaultTip
        
    }

}

