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
    
    
    
    
    /*
 
    Create image array = [1,3,4,5]          //image 2 is not included because it will be a stage image for stage 1
 
    let exct1 = "Bring your legs together; slide one foot up onto your leg, until it is placed on your other knee. Maintain balance and bring your hands together, then place them together directly above your head."
 
 
    let exc3 = "bend one knee and hold it back with your hand. Pull it back until you feel a stretch. Maintain this position and stretch your other hand forward, until you feel a stretch as well."
 
    let exc4 = "Remain seated as before with your legs crossed. Bring your hands together to the middle of your body and then slowly raise them directly above your head."
 
    let exc5 = "Sit down, and cross your legs. place your arms on each side as shown. Bring your hands into Gyan Mudra by joining the index finger and thumb on each hand."
 
 
    Randomize func:
            Randomly pick an image out of image array [1,3,4,5]
            -Depending on the number picked out, display one of the string variables.
 
    if img 1 then
        display exc1
 
    if img 3 then
        display exc3
    
    if img 4 then 
        display exc4
    
    if img 5 then
        display exc5
    
    
    
    
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

