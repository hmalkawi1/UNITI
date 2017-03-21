//
//  ViewController.swift
//  Timer
//
//  Created by Shawn Noruzi on 2017-03-06.
//  Copyright © 2017 Shawn Noruzi. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    
    
  
    @IBOutlet weak var timerSlider: UISlider!
    @IBAction func timerSlider(_ sender: UISlider) {
        SwiftCounter = Int(sender.value)
        countingLabel.text = String(SwiftCounter)
    }
    
    
    
    
    
    // The Timer
    @IBOutlet weak var countingLabel: UILabel! // Display label
    var SwiftTimer = Timer() // Timer object
    var SwiftCounter = 0  // Counting label
    
    // Start button
    @IBAction func startButton(_ sender: AnyObject) {
        SwiftTimer = Timer.scheduledTimer(timeInterval:1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
    }
    
    // Pause button
    @IBAction func pauseButton(_ sender: AnyObject) {
        SwiftTimer.invalidate()
    }
    
    // Clear button
    @IBAction func clearButton(_ sender: AnyObject) {
        SwiftTimer.invalidate() // Pauses the counter
        SwiftCounter = 0 // Resets counter var
        countingLabel.text = String(SwiftCounter) // Update label
    }
    
    func updateCounter() {
        SwiftCounter -= 1 // Increment counter val
        countingLabel.text = String(describing:SwiftCounter)
    }
    
    
    //Prepare the Time value (Duration) to be sent to the second view controller.
   /*
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC : SecondViewController = segue.destination as! SecondViewController
        secondVC.Timer_Value = Time_Selected
    }
     */
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
        countingLabel.text = String(SwiftCounter) // Update label
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

