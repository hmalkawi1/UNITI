//
//  anxiety1.swift
//  Final Quiz
//
//  Created by wei yao on 2017-03-06.
//  Copyright © 2017 wei yao. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    var receivedString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = receivedString
        
        // Do any additional setup after loading the view.
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
