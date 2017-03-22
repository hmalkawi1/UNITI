//
//  TherapyListViewViewController.swift
//  NewDraft1
//
//  Created by Joe Xu on 3/11/17.
//  Copyright © 2017 UNITI. All rights reserved.
//

import UIKit

class TherapyListViewViewController: UIViewController {

    
    @IBOutlet weak var img: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        img.backgroundColor = UIColor.black;
        img.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 240.0 / 667 * self.view.bounds.height);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    

}
