//
//  ViewController.swift
//  TimerProject
//
//  Created by Osman Yıldız on 20.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
        counter = 10
        timeLabel.text = "Time: \(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        
        
    }
    
    @objc func timerFunc(){
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter < 0 {
            timer.invalidate()
            timeLabel.text = "Time's Over!"
        }
        
    }

    
    @IBAction func buttonClicked(_ sender: Any) {
    }
    
}

