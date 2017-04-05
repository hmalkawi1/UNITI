//
//  LoViewController.swift
//  UNITI
//
//  Created by wei yao on 2017-04-05.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class LoViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    
    @IBAction func login(_ sender: Any) {
        if let email = username.text , let pass = password.text
        
        {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
            if user != nil{
             self.performSegue(withIdentifier: "goto", sender: self)
            
            }
                
            else{
            
            
            
            }
        })
        
        
        }
    }

    @IBAction func register(_ sender: Any) {
        
        
        if let email = username.text , let pass = password.text
            
        {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                if user != nil{
                    self.performSegue(withIdentifier: "goto", sender: self)
                    
                }
                    
                else{
                    
                    
                    
                }
            })
            
            
        }
        
    }


}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

