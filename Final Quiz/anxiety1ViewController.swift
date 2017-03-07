//
//  anxiety1ViewController.swift
//  Final Quiz
//
//  Created by Mike Bassili on 3/7/17.
//  Copyright © 2017 wei yao. All rights reserved.
//

import UIKit

class anxiety1ViewController: UIViewController {

    // Set total score to zero
    var totalAnxietyScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
