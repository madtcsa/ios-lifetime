//
//  ViewController.swift
//  LifeTime
//
//  Created by 陈伟 on 2018/11/30.
//  Copyright © 2018 kkxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate{
    
    
    @IBOutlet weak var birthDay: UIDatePicker!
    let appDefaults = UserDefaults.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print("date changed")
        saveUserBirthDay()
    }
    
    private func saveUserBirthDay(){
        let date = birthDay.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日"
        print(dateFormatter.string(from: date))
        dateFormatter.dateFormat = "yyyy"
        let yearStr = dateFormatter.string(from: date)
        self.appDefaults.set(Int(yearStr), forKey: Constants.init().userBirthDayYear)
        dateFormatter.dateFormat = "MM";
        let monthStr = dateFormatter.string(from: date)
        self.appDefaults.set(Int(monthStr), forKey: Constants.init().userBirthDayMonth)
        dateFormatter.dateFormat = "dd"
        let dateStr = dateFormatter.string(from: date)
        self.appDefaults.set(Int(dateStr), forKey: Constants.init().userBirthDayDate)
    }
    
    
    @IBAction func cancleSetDateAction(_ sender: UIBarButtonItem) {
        
        
    }
    @IBAction func finishSelectDateAction(_ sender: UIBarButtonItem) {
        
    }
}

