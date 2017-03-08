//
//  anxiety1ViewController.swift
//  Final Quiz
//
//  Created by Mike Bassili on 3/7/17.
//  Copyright © 2017 wei yao. All rights reserved.
//

import UIKit

class anxiety1ViewController: UIViewController {

    @IBOutlet weak var Scroll: UIScrollView!
    
    
    
    // Set total score to zero
    var totalAnxietyScore = 10
    
    // Anxiety score label
    @IBOutlet weak var displayAnxietyScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Scroll.contentSize.height = 1000
        
        

        // Do any additional setup after loading the view.
    }
    
    // Calculate the anxiety score on button tap
    @IBAction func calculateAnxietyScore(_ sender: AnyObject) {
        // Evaluate score
        if totalAnxietyScore < 5 {
            displayAnxietyScore.text = "Mild Anxiety"
        } else if totalAnxietyScore >= 5 && totalAnxietyScore < 10 {
            displayAnxietyScore.text = "Moderate Anxiety"
        } else if totalAnxietyScore >= 10 {
            displayAnxietyScore.text = "Severe Anxiety"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Send the total score to the next page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Segue totalAnxietyScore to anxiety2ViewController
    }

}
