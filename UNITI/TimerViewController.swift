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
    
    
    
    
    
    // The Timer
    @IBOutlet weak var countingLabel: UILabel! // Display label
    var SwiftTimer = Timer() // Timer object
    var SwiftCounter = 0  // Counting label
    var PlayFlag = 0 // 0 if paused, 1 if running
    @IBOutlet weak var TimerDir: UILabel! // Instructions
    
    @IBOutlet weak var timerSlider: UISlider!
    @IBAction func timerSlider(_ sender: UISlider) {
        SwiftCounter = Int(sender.value)
        countingLabel.text = String(SwiftCounter)
    }
    
    // Start button
    @IBAction func startButton(_ sender: AnyObject) {
        if PlayFlag == 0{
            PlayFlag = 1 // Trigger flag
            timerSlider.isHidden = true // Hide slider
            TimerDir.text = "Sit down and relax." // Change timer direction label
            SwiftTimer = Timer.scheduledTimer(timeInterval:1, target:self, selector: Selector("updateCounter"), userInfo: nil, repeats: true)
        }
    }
    
    // Pause button
    @IBAction func pauseButton(_ sender: AnyObject) {
        PlayFlag = 0 // Trigger flag
        timerSlider.isHidden = false // Show slider
        SwiftTimer.invalidate()
    }
    
    // Clear button
    @IBAction func clearButton(_ sender: AnyObject) {
        PlayFlag = 0 // Reset flag
        timerSlider.isHidden = false // Show slider
        SwiftTimer.invalidate() // Pauses the counter
        TimerDir.text = "Select the session duration." // Update directions
        SwiftCounter = 0 // Resets counter var
        countingLabel.text = String(SwiftCounter) // Update label
    }
    
    // Decrements counter
    func updateCounter() {
        if SwiftCounter > 0 {
            SwiftCounter -= 1 // Increment counter val
            countingLabel.text = String(describing:SwiftCounter)
        }
        else {
            PlayFlag = 0 // Trigger flag
            SwiftTimer.invalidate()
        }
    }
    
    
    
    
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

