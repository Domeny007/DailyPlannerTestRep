//
//  ToDoListViewController.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 20.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//
import FSCalendar
import UIKit

class ToDoListViewController: UIViewController, FSCalendarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let caseCellIdentifier = "caseIdentifier"
    fileprivate let nibNameString = "CaseTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
    }
    
    func registerNib() {
        let nib = UINib(nibName: nibNameString, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: caseCellIdentifier)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dayString = formatter.string(from: date)
        print("Selected", dayString)
        DispatchQueue.main.async {
            self.tableView.reloadData()
            print("reloaded")
        }
    }
    
    //MARK:- Working with tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: caseCellIdentifier, for: indexPath) as! CaseTableViewCell
        cell.caseNameLabel.text = "Название кейса"
        cell.caseHoursLabel.text = String(indexPath.row + 1)
        return cell
    }
    let array = ["Название","Дата","Описание"]
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segue", sender: array)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailCaseViewController {
            vc.destArray = sender as! [String]
            
        }
    }
}
