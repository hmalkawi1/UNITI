//
//  SecondViewController.swift
//  Timer
//
//  Created by Shawn Noruzi on 2017-03-06.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class TimerSecondViewController: UIViewController {

    
    
    var Timer_Value = 0
    var timer = Timer()
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func START(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerSecondViewController.countdown), userInfo: nil, repeats: true)
    }

    
    func countdown (){

        Timer_Value = Timer_Value - 1
        label.text = String(Timer_Value)

        if (Timer_Value == 0){
            timer.invalidate()
        }
    }

    
    @IBAction func STOP(_ sender: UIButton) {
                timer.invalidate()
    }
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label.text = String(Timer_Value)
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
