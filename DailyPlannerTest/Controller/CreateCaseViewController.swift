//
//  CreateCaseViewController.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 21.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit
import RealmSwift
import FSCalendar


class CreateCaseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, FSCalendarDelegate  {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var dayNumber = 0
    var hours:Int = 0
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createButtonPressed(_ sender: UIButton) {
        print(dayNumber)
        let newCase = Case()
        newCase.caseDateStart = hours
        newCase.caseDateFinish = hours
        newCase.day_id = dayNumber
        newCase.caseDescription = descriptionTextView.text
        newCase.caseName = nameTextField.text ?? ""
        try! realm.write {
            realm.add(newCase)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    //MARK:- working with selection of the day
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dayString = formatter.string(from: date)
        print("Selected", dayString)
        dayNumber = Int(dayString)!
        
    }
    //MARK:- creating custom picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
       }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row):00 - \(row ):00"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        default:
            break;
        }
    }
}
