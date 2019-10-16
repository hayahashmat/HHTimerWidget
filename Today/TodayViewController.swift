//
//  TodayViewController.swift
//  Today
//
//  Created by Haya on 10/10/19.
//  Copyright © 2019 Haya. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnStartt: UIButton!
    var timer = Timer()
 var seconds = 0
    @IBOutlet weak var lblCounter: UILabel!
    @objc func updateInfo() {
       if seconds > 0{
        seconds = seconds - 1
        
         lblCounter.text = timeFormatted(seconds)
        }
       else if seconds == 0{
        
        timer.invalidate()
        self.btnStartt.isHidden = false
      self.btnAdd.isHidden = false
        }
        
            //   timer.invalidate()
   //     }
     //   else{
       //    seconds = 0
//              lblCounter.text = timeFormatted(seconds)
//              timer.invalidate()
        //}
//        lblCounter.text =  seconds += 1
//        lblSecond.text = timeFormatted(seconds)
    }
    /// @brief This method is use to format the time string
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblCounter.text = timeFormatted(seconds)
        // Do any additional setup after loading the view.
        
       
    }
        
    func widgetPerformUpdate(completionHandler: @escaping (NCUpdateResult) -> Void) {
        completionHandler(.newData)
    }
    @IBAction func btnAdd(_ sender: Any) {
        seconds = seconds + 15
        lblCounter.text = timeFormatted(seconds)
    }
    
    @IBAction func btnStart(_ sender: Any) {
        self.btnStartt.isHidden = true
        self.btnAdd.isHidden = true
  //  seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateInfo), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }
}
