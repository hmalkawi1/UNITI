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
    
    @IBAction func save(_ sender: Any) {
        
        if (displayDepressionScore.text != " ")
        {
            
          //  list.append(displayDepressonScore.text!)
            displayDepressionScore.text = " "
            
            
        }
        
    }
    
    
    
    // Depression score which is set to 0
    var totalDepressionResult = 0
    
    // Depression label
    
    
    var answerd1 = 0
    var answerd2 = 0
    var answerd3 = 0
    var answerd4 = 0
    var answerd5 = 0
    var answerd6 = 0
    var answerd7 = 0
    var answerd8 = 0
    var answerd9 = 0
    
    
    @IBOutlet weak var Questiond1: UILabel!
    
    
    @IBAction func Answerd1(_ sender: UISlider) {
      
        answerd1 = Int(sender.value)
        Questiond1.text = String(answerd1)
        
        
    }
    
    
    @IBOutlet weak var Questiond2: UILabel!
    
    @IBAction func Answerd2(_ sender: UISlider) {
        
        answerd2 = Int(sender.value)
        Questiond2.text = String(answerd2)
    }
    
    
    @IBOutlet weak var Questiond3: UILabel!
    
    @IBAction func Answerd3(_ sender: UISlider) {
        
        answerd3 = Int(sender.value)
        Questiond3.text = String(answerd3)
        
    }
    
    @IBOutlet weak var Questiond4: UILabel!
    
    @IBAction func Answerd4(_ sender: UISlider) {
        
        
        answerd4 = Int(sender.value)
        Questiond4.text = String(answerd4)
    }
    
    @IBAction func Answerd5(_ sender: UISlider) {
        
        
        
        answerd5 = Int(sender.value)
        Questiond5.text = String(answerd5)
    }
    @IBOutlet weak var Questiond5: UILabel!
    
    
    
    @IBOutlet weak var Questiond6: UILabel!
    
    @IBAction func Answerd6(_ sender: UISlider) {
        answerd6 = Int(sender.value)
        Questiond6.text = String(answerd6)
    }
    
    @IBOutlet weak var Questiond7: UILabel!
    
    
    @IBAction func Answerd7(_ sender: UISlider) {
        answerd7 = Int(sender.value)
        Questiond7.text = String(answerd7)
        
    }
    
    @IBOutlet weak var Questiond8: UILabel!
    
    
    @IBAction func Answerd8(_ sender: UISlider) {
        answerd8 = Int(sender.value)
        Questiond8.text = String(answerd8)
        
    }
    
    
    @IBOutlet weak var Questiond9: UILabel!
    
    @IBAction func Answerd9(_ sender: UISlider) {
        
        answerd9 = Int(sender.value)
        Questiond9.text = String(answerd9)
    }
    
    @IBOutlet weak var displayDepressionScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll2.contentSize.height  = 1000
        
        // Do any additional setup after loading the view.
    }
    
    // Calculate depression score on click
    @IBAction func calculateDepressionScore(_ sender: AnyObject) {
        
        totalDepressionResult = answerd1 + answerd2 + answerd3 + answerd4 + answerd5 + answerd6 + answerd7 + answerd9 + answerd8
        
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
