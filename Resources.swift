//
//  Resources.swift
//  UNITI
//
//  Created by Shawn Noruzi on 3/11/17.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class Resources: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://www.sfu.ca/students/health/events/mindfulness-meditation.html")
        
        webview.loadRequest(URLRequest(url: url!))
        
        
        
        
        
        
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
