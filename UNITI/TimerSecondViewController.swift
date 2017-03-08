//
//  SecondViewController.swift
//  Timer
//
//  Created by Shawn Noruzi on 2017-03-06.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    //Holds value thats segued from TimerViewController
    var Timer_Value = 0
    
    //Instantiates timer variable to the Timer() function
    var timer = Timer()
    
    //Enables the scheduledTimer of the Timer() function - every second the countdown function is called and is repeated every second.
    @IBAction func START(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(SecondViewController.countdown), userInfo: nil, repeats: true)
    }
    
    //Stops the scheduledTimer from running every second.
    @IBAction func STOP(_ sender: UIButton) {
        
        timer.invalidate()
    }
    
    //Decrements the value of Timer_Value by 1 every time countdown is run. If Timer_Value reaches 0 then the scheduledTimer will stop running by invalidating the timer.
    func countdown() {
        
        Timer_Value = Timer_Value - 1
        label.text = String(Timer_Value)
        
        if (Timer_Value==0)
        { timer.invalidate() }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //Loads the value passed from the slider in TimerViewController into label as a string.
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
