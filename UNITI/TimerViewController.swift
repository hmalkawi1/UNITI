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
            // Calculate time
            hSwiftCounter -= 1 // Increment counter val
            hTimerMinutes = hSwiftCounter / 60 // Calculate Minutes
            hTimerSeconds = hSwiftCounter % 60 // Calculate Seconds
            // Vibrate every 5 seconds
            if hTimerSeconds % 5 == 0 {
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate); // Vibrate phone
            }
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
    
    // Struture defining exercises and variables
    public struct Exercise {
        var excImage:String // Image
        var excText:String // Description of exc
    }

    // Generate exercises from struct
    var stretch1 = Int(arc4random() % 4) //Generates first stretch
    var stretch2 = Int(arc4random() % 4) // Generates second stretch
    var stretch3 = Int(arc4random() % 4) // Generates second stretch
    
    // Stretch 1 Elements
    @IBOutlet weak var stretch1Label: UILabel!      // Text
    @IBOutlet weak var stretch1Image: UIImageView!  // Image
    @IBAction func stretch1RevealButton(_ sender: AnyObject) {
        // Populate guided session
        stretch1Label.text = excList[stretch1].excText                              // Populate text
        stretch1Image.image = UIImage(named: String(excList[stretch1].excImage))    // Populate image
    }
    
    // Stretch 2 Elements
    @IBOutlet weak var stretch2Label: UILabel!      // Text
    @IBOutlet weak var stretch2Image: UIImageView!  // Image
    @IBAction func stretch2RevealButton(_ sender: AnyObject) {
        // Generate exercise from struct
        while stretch2 == stretch1 {
            stretch2 = Int(arc4random() % 4)
        }
        
        // Populate guided session
        stretch2Label.text = excList[stretch2].excText                              // Populate text
        stretch2Image.image = UIImage(named: String(excList[stretch2].excImage))    // Populate image
    }
    
    // Stretch 3 Elements
    @IBOutlet weak var stretch3Label: UILabel!      // Text
    @IBOutlet weak var stretch3Image: UIImageView!  // Image
    @IBAction func stretch3RevealButton(_ sender: AnyObject) {
        // Generate exercise from struct
        while stretch3 == stretch1 || stretch3 == stretch2 {
            stretch3 = Int(arc4random() % 4)
        }
        
        // Populate guided session
        stretch3Label.text = excList[stretch3].excText                              // Populate text
        stretch3Image.image = UIImage(named: String(excList[stretch3].excImage))    // Populate image
    }
    
    
    // List of all excercises and their images
    // excList[i] -> imagei and texti, 0 < i < 3
    let excList = [
        Exercise(excImage: "sitting2.png", excText: "Bring your legs together; slide one foot up onto your leg, until it is placed on your other knee. Maintain balance and bring your hands together, then place them together directly above your head."),
                   Exercise(excImage: "standingLeg2.png", excText: "Bend one knee and hold it back with your hand. Pull it back until you feel a stretch. Maintain this position and stretch your other hand forward, until you feel a stretch as well." ),
                   Exercise(excImage: "sitting1.png", excText: "Remain seated as before with your legs crossed. Bring your hands together to the middle of your body and then slowly raise them directly above your head." ),
                   Exercise(excImage: "armsRaised1.png", excText: "Sit down, and cross your legs. place your arms on each side as shown. Bring your hands into Gyan Mudra by joining the index finger and thumb on each hand." )]
    
    
    
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
        
    }

    // Garbage collection
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

