//
//  newEntryViewController.swift
//  UNITI
//
//  Created by shawn noruzi on 2017-04-04.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class newEntryViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var text:String = ""
    
    var masterView:DiaryViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = text
        //first object to get any events - purpose = to show keyboard on opening view
        textView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    //change text from the previous view controller
    func setText(t:String){
        text = t
        if isViewLoaded{
        //only reference textView if viewDidLoad has been called
        textView.text = t
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //change newRowText when done
        masterView.newRowText=textView.text
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
