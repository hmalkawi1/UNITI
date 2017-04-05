//
//  puppyTherapy.swift
//  UNITI
//
//  Created by wei yao on 2017-04-04.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class puppyTherapy: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = URL(string: "https://www.sfu.ca/students/health/events/puppy_therapy_2017.html")
        
        webview.loadRequest(URLRequest(url: url!))
        
        

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
