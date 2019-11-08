//
//  switchViewController.swift
//  Pigs Calculator
//
//  Created by Kwok Leung Tse on 28/1/2024.
//  Copyright © 2024 tsekennykl. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    var switchMode:String = "smart"  //"smart" or "strawberry"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func strawberry_click(_ sender: UIButton) {
        self.switchMode = "strawberry"
        performSegue(withIdentifier: "goToCalculator", sender: self)
    }
    
    @IBAction func smartPig_click(_ sender: UIButton) {
        self.switchMode = "smart"
        performSegue(withIdentifier: "goToCalculator", sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculator"{
            let destinationVC = segue.destination as! CalculatorViewController
                
            destinationVC.mode = self.switchMode
           
            
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
