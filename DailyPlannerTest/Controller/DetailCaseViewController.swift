//
//  DetailCaseViewController.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 20.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import UIKit

class DetailCaseViewController: UIViewController {

    @IBOutlet weak var caseNameLabel: UILabel!
    @IBOutlet weak var dateAndTimeLabel: UILabel!
    @IBOutlet weak var caseDescriptionTextView: UITextView!
    
    var destArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caseNameLabel.text = destArray[0]
        caseDescriptionTextView.text = destArray[1]
        dateAndTimeLabel.text = destArray[2]
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    //MARK:- function to present details of the case
}
