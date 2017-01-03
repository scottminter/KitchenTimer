//
//  ViewController.swift
//  Kitchen Timer
//
//  Created by Scott Minter on 1/3/17.
//  Copyright © 2017 Scott Minter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer = Timer()
    var seconds: Int = 0

    @IBAction func startTimer(_ sender: Any) {
        print("Start timer")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
    }

    @IBAction func pauseTimer(_ sender: Any) {
        print("Pause timer")
        timer.invalidate()
    }

    @IBAction func minusTenSecs(_ sender: Any) {
        print("Minus 10 secs")
        
        if seconds >= 10 {
            seconds -= 10
        } else {
            seconds = 0
        }
        
        updateTimeLabel(secs: seconds)
    }
    
    @IBAction func plusTenSecs(_ sender: Any) {
        print("Add 10 secs")
        
        seconds += 10
        updateTimeLabel(secs: seconds)
    }
    
    @IBAction func resetTimer(_ sender: Any) {
        print("Reset timer")
        
        seconds = 0
        updateTimeLabel(secs: seconds)
    }
    
    func incrementTimer() {
        if seconds > 0 {
            seconds -= 1
        } else {
            print("Stop timer at \(seconds) seconds")
            timer.invalidate()
        }
        
        updateTimeLabel(secs: seconds)
    }

    func updateTimeLabel(secs: Int) {
        timeLabel.text = String(secs)
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

