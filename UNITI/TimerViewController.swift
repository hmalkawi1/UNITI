//
//  ViewController.swift
//  Timer
//
//  Created by Shawn Noruzi on 2017-03-06.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    //Starting value for Time_Selected is 30 minutes
    var Time_Selected = 30
    
    //This shows what the slider's value is
    @IBOutlet weak var Timer_Display: UILabel!
    
    //This is how users select the duration - also sets Time_Selected to an int value.
    //Time Slider Value Range [30,240]


    @IBAction func Time_Slider(_ sender: UISlider) {
        Time_Selected = Int(sender.value)
        Timer_Display.text = String(Time_Selected)
    }
    
    
    
    
    //Prepare the Time value (Duration) to be sent to the second view controller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC : TimerSecondViewController = segue.destination as! TimerSecondViewController
        secondVC.Timer_Value = Time_Selected
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
