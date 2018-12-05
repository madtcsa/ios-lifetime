//
//  TimeViewController.swift
//  LifeTime
//
//  Created by 陈伟 on 2018/12/1.
//  Copyright © 2018 kkxx. All rights reserved.
//

import UIKit


class TimeViewController: UIViewController {
    
    let appDefault = UserDefaults.init()
    var userBirthDate:CLong = 0
    var userBirthStrDate:String = ""
    let calender = NSCalendar.current
    var currentDate = Date()
    let dateFormatter = DateFormatter()
    var birthDate:Date?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "yyyy/MM/dd";
        
        // Do any additional setup after loading the view.
        initBirthDate()
        calculateYear()
    }
    
    
    func initBirthDate() {
        userBirthDate = appDefault.integer(forKey: Constants.init().userBirthDayKey)
        userBirthStrDate = appDefault.string(forKey: Constants.init().userBirthDayStrKey)!
        birthDate = dateFormatter.date(from: userBirthStrDate)
        print(userBirthStrDate)
    }
    
    func calculateMinute() -> Float {
        
        return 0
    }
    
    func calculateHour() -> Float {
        
        return 0
    }
    
    func calculateDay() -> Float {
        let day = calender.dateComponents([.day], from: birthDate!, to:Date())
        return 0
    }
    
    func calculateWeek() -> Float {
        return 0
    }
    
    func calculateMonth() -> Float {
        return 0
    }
    
    func calculateYear() -> Float {
        let year = calender.dateComponents([.year], from: birthDate!, to:Date())
        print(year)
        return 0
    }
    
}
