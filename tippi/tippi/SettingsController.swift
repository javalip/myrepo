//
//  SettingsController.swift
//  tippi
//
//  Created by Preeti  on 9/29/16.
//  Copyright © 2016 preeti. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showDefaultTip()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setDefaultTip(sender: AnyObject) {
       let tipDefault = NSUserDefaults()
         tipDefault.setInteger(tipControl.selectedSegmentIndex, forKey: "tipIndex")
        self.performSegueWithIdentifier("mainscreen", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mainscreen"{
                segue.destinationViewController as! ViewController
        }
    }
    
    
    func showDefaultTip(){
        // Read default tip from local storage. If local storage is empty then take default from story board.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = defaults.integerForKey("tipIndex")
        tipControl.selectedSegmentIndex = defaultTip
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
