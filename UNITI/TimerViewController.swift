// ------------------------------------------------------ //
// TimerViewController.swift                              //
// Timer, Guided and Haptic Meditation                    //
//                                                        //
// Created by Mike and Homam on 2017-03-06.               //
// Copyright © 2017  Mike and Homam. All rights reserved. //
// ------------------------------------------------------ //

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    // ----------------- //
    // Haptic Meditation //
    // ----------------- //
    
    // Timer meditation variables
    @IBOutlet weak var hCountingLabel: UILabel! // Display label
    var hSwiftTimer = Timer() // Timer object
    var hSwiftCounter = 0  // Counting label
    var hTimerMinutes = 0 // Reset minutes
    var hTimerSeconds = 0 // Reset seconds
    var hPlayFlag = 0 // 0 if paused, 1 if running
    @IBOutlet weak var hTimerDir: UILabel! // Instructions
    
    // Timer session select slider
    @IBOutlet weak var hTimerSlider: UISlider!
    @IBAction func hTimerSlider(_ sender: UISlider) {
        hSwiftCounter = Int(sender.value) * 60 // Update var with slider value
        hTimerMinutes = hSwiftCounter / 60 // Calculate Minutes
        hTimerSeconds = hSwiftCounter % 60 // Calculate Seconds
        if hTimerSeconds == 0 {
            hCountingLabel.text = String(format:String(hTimerMinutes) + ":00") // Update slider with save value
        }
        else {
            hCountingLabel.text = String(format:String(hTimerMinutes) + ":" + String(hTimerSeconds)) // Update slider with save value
        }
    }
    
    // Start button
    @IBAction func hStartButton(_ sender: AnyObject) {
        // Check if counter is paused
        if hPlayFlag == 0 {
            hPlayFlag = 1 // Trigger flag
            hTimerSlider.isHidden = true // Hide slider
            hTimerDir.text = "Place phone in your pocket." // Change timer direction label
            hSwiftTimer = Timer.scheduledTimer(timeInterval:1, target:self, selector: Selector("hUpdateCounter"), userInfo: nil, repeats: true)
        }
    }
    
    // Pause button
    @IBAction func hPauseButton(_ sender: AnyObject) {
        hPlayFlag = 0 // Trigger flag
        hTimerSlider.isHidden = false // Show slider
        hSwiftTimer.invalidate()
    }
    
    // Clear button
    @IBAction func hClearButton(_ sender: AnyObject) {
        hPlayFlag = 0 // Reset flag
        hTimerSlider.value = 0 // Reset slider value
        hTimerSlider.isHidden = false // Show slider
        hSwiftTimer.invalidate() // Pauses the counter
        hTimerDir.text = "Select the session duration." // Update directions
        hSwiftCounter = 0 // Resets counter var
        hTimerMinutes = hSwiftCounter / 60 // Calculate Minutes
        hTimerSeconds = hSwiftCounter % 60 // Calculate Seconds
        if hTimerSeconds == 0 {
            hCountingLabel.text = String(format:String(hTimerMinutes) + ":00") // Update slider with save value
        }
        else if hTimerSeconds < 10 {
            hCountingLabel.text = String(format:String(hTimerMinutes) + ":0" + String(hTimerSeconds)) // Update slider with save value
        }
        else {
            hCountingLabel.text = String(format:String(hTimerMinutes) + ":" + String(hTimerSeconds)) // Update slider with save value
        }
    }
    
    // Decrements counter
    func hUpdateCounter() {
        // Check to see if counter is currently active
        if hSwiftCounter > 0 {
            // Vibrate every 5 seconds
            if hSwiftCounter % 5 == 0 {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate); // Vibrate phone
            }
            hSwiftCounter -= 1 // Increment counter val
            hTimerMinutes = hSwiftCounter / 60 // Calculate Minutes
            hTimerSeconds = hSwiftCounter % 60 // Calculate Seconds
            if hTimerSeconds == 0 {
                hCountingLabel.text = String(format:String(hTimerMinutes) + ":00") // Update slider with save value
            }
            else if hTimerSeconds < 10 {
                hCountingLabel.text = String(format:String(hTimerMinutes) + ":0" + String(hTimerSeconds)) // Update slider with save value
            }
            else {
                hCountingLabel.text = String(format:String(hTimerMinutes) + ":" + String(hTimerSeconds)) // Update slider with save value
            }
        }
            // Handle a timer who's already counting
        else {
            hPlayFlag = 0 // Trigger flag
            hSwiftTimer.invalidate()
        }
    }
    
    
    
    // ----------------- //
    // Guided Meditation //
    // ----------------- //
    
    // Todo
    // - Define excercises
    // - Randomly choose exercises (opt)
    // - Display excercises to user
    // - Display image with exercise
    
    
    
    // ---------------- //
    // Timed Meditation //
    // ---------------- //
    
    // Timer meditation variables
    @IBOutlet weak var countingLabel: UILabel! // Display label
    var SwiftTimer = Timer() // Timer object
    var SwiftCounter = 0  // Counting label
    var TimerMinutes = 0 // Reset minutes
    var TimerSeconds = 0 // Reset seconds
    var PlayFlag = 0 // 0 if paused, 1 if running
    @IBOutlet weak var TimerDir: UILabel! // Instructions
    
    // Timer session select slider
    @IBOutlet weak var timerSlider: UISlider!
    @IBAction func timerSlider(_ sender: UISlider) {
        SwiftCounter = Int(sender.value) * 60 // Update var with slider value
        TimerMinutes = SwiftCounter / 60 // Calculate Minutes
        TimerSeconds = SwiftCounter % 60 // Calculate Seconds
        if TimerSeconds == 0 {
            countingLabel.text = String(format:String(TimerMinutes) + ":00") // Update slider with save value
        }
        else {
            countingLabel.text = String(format:String(TimerMinutes) + ":" + String(TimerSeconds)) // Update slider with save value
        }
    }
    
    // Start button
    @IBAction func startButton(_ sender: AnyObject) {
        // Check if counter is paused
        if PlayFlag == 0 {
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
        timerSlider.value = 0 // Reset slider value
        timerSlider.isHidden = false // Show slider
        SwiftTimer.invalidate() // Pauses the counter
        TimerDir.text = "Select the session duration." // Update directions
        SwiftCounter = 0 // Resets counter var
        TimerMinutes = SwiftCounter / 60 // Calculate Minutes
        TimerSeconds = SwiftCounter % 60 // Calculate Seconds
        if TimerSeconds == 0 {
            countingLabel.text = String(format:String(TimerMinutes) + ":00") // Update slider with save value
        }
        else if TimerSeconds < 10 {
            countingLabel.text = String(format:String(TimerMinutes) + ":0" + String(TimerSeconds)) // Update slider with save value
        }
        else {
            countingLabel.text = String(format:String(TimerMinutes) + ":" + String(TimerSeconds)) // Update slider with save value
        }
    }
    
    // Decrements counter
    func updateCounter() {
        // Check to see if counter is currently active
        if SwiftCounter > 0 {
            SwiftCounter -= 1 // Increment counter val
            TimerMinutes = SwiftCounter / 60 // Calculate Minutes
            TimerSeconds = SwiftCounter % 60 // Calculate Seconds
            if TimerSeconds == 0 {
                countingLabel.text = String(format:String(TimerMinutes) + ":00") // Update slider with save value
            }
            else if TimerSeconds < 10 {
                countingLabel.text = String(format:String(TimerMinutes) + ":0" + String(TimerSeconds)) // Update slider with save value
            }
            else {
                countingLabel.text = String(format:String(TimerMinutes) + ":" + String(TimerSeconds)) // Update slider with save value
            }
        }
        // Handle a timer who's already counting
        else {
            PlayFlag = 0 // Trigger flag
            SwiftTimer.invalidate()
        }
    }
    
    
    
    // -------------- //
    // Meta Functions //
    // -------------- //
    
    // Viewport load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
        
    }

    // Garbage collection
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

