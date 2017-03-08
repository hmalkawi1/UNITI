//
//  depression1ViewController.swift
//  Final Quiz
//
//  Created by Mike Bassili on 3/7/17.
//  Copyright © 2017 wei yao. All rights reserved.
//

import UIKit

class depression1ViewController: UIViewController {

    @IBOutlet weak var scroll2: UIScrollView!
    
    
    // Depression score which is set to 0
    var totalDepressionResult = 12 // 10 for testing purposes
    
    // Depression label
    @IBOutlet weak var displayDepressionScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll2.contentSize.height  = 1000
        
        // Do any additional setup after loading the view.
    }
    
    // Calculate depression score on click
    @IBAction func calculateDepressionScore(_ sender: AnyObject) {
        if totalDepressionResult >= 0 && totalDepressionResult <= 4 {
            displayDepressionScore.text = "Normal"
        } else if totalDepressionResult >= 5 && totalDepressionResult <= 9 {
            displayDepressionScore.text = "Minimally Depressive"
        } else if totalDepressionResult >= 10 && totalDepressionResult <= 14 {
            displayDepressionScore.text = "Major Depressive (Mild)"
        } else if totalDepressionResult >= 15 && totalDepressionResult <= 19 {
            displayDepressionScore.text = "Major Depressive (Moderate)"
        } else if totalDepressionResult >= 20 {
            displayDepressionScore.text = "Major Depressive (Severe)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
