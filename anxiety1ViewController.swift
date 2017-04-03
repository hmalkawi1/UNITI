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
    
    
 

    
  
    
    @IBAction func save(_ sender: Any) {
        
        
        if(displayAnxietyScore.text != "" )
        {
            list.append(displayAnxietyScore.text!)
            displayAnxietyScore.text = " "
            
            
            
        }
        
    }
    @IBOutlet weak var displayAnxietyScore: UILabel!
    
    // Set total score to zero
    var totalAnxietyScore = 0
    
    var answer1 = 0
    var answer2 = 0
    var answer3 = 0
    var answer4 = 0
    var answer5 = 0
    var answer6 = 0
    var answer7 = 0
    
    @IBOutlet weak var Question6: UILabel!
    
    @IBOutlet weak var Question7: UILabel!
    
    @IBAction func Answer6(_ sender: UISlider) {
        
        answer6 = Int(sender.value)
        Question6.text = String(answer6)
    }
    
    
    @IBAction func Answer7(_ sender: UISlider) {
        
        answer7 = Int(sender.value)
        Question7.text = String(answer1)
        
        
    }
    
    
    
    @IBOutlet weak var Question1: UILabel!
    
    
    @IBAction func Answer1(_ sender: UISlider) {
        
        answer1 = Int(sender.value)
        Question1.text = String(answer1)
  
    }
    
    @IBOutlet weak var Question2: UILabel!
    
    
    @IBAction func Answer2(_ sender: UISlider) {
        answer2 = Int(sender.value)
        Question2.text = String(answer2)
    }


    @IBOutlet weak var Question3: UILabel!
    
    @IBAction func Answer3(_ sender: UISlider) {
        answer3 = Int(sender.value)
        Question3.text = String(answer3)
    }
    
    @IBOutlet weak var Question4: UILabel!
    
    @IBAction func Answer4(_ sender: UISlider) {
        
        answer4 = Int(sender.value)
        Question4.text = String(answer4)
        
    }
    
    @IBOutlet weak var Question5: UILabel!
    
    @IBAction func Answer5(_ sender: UISlider) {
        
        answer5 = Int(sender.value)
        Question5.text = String(answer5)
        
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Scroll.contentSize.height = 1000
        
        

        // Do any additional setup after loading the view.
    }
    
    // Calculate the anxiety score on button tap
    @IBAction func calculateAnxietyScore(_ sender: AnyObject) {
        
        totalAnxietyScore = answer7 + answer6 + answer5 + answer4 + answer3 + answer2 + answer1
        
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
