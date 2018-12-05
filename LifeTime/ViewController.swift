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
        let str = self.appDefaults.string(forKey: Constants.init().userBirthDayStrKey)
        print(str!)
        if nil != self.appDefaults.string(forKey: Constants.init().userBirthDayStrKey){
            let timeView = TimeViewController()
            print("performSegue")
            self.performSegue(withIdentifier: "goToTimeViewScreen", sender: self)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print("date changed")

    }
    
    private func saveUserBirthDay(){
        let date = birthDay.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        print(dateFormatter.string(from: date))
        self.appDefaults.set(dateFormatter.string(from: date), forKey: Constants.init().userBirthDayStrKey)
        self.appDefaults.set(Int(date.timeIntervalSince1970), forKey: Constants.init().userBirthDayKey)
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
        performSegue(withIdentifier: "goToTimeViewScreen", sender: self)
        saveUserBirthDay()
    }
}

