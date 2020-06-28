//
//  CreateCaseViewController.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 21.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class CreateCaseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var hours:Int = 0
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func createButtonPressed(_ sender: UIButton) {
        
    }
    
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
        return pickerView.frame.size.width/2
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
         return "\(row):00 - \(row + 1):00"
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
