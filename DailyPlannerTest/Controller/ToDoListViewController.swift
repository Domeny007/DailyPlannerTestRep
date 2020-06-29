//
//  ToDoListViewController.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 20.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//
import FSCalendar
import UIKit
import SwiftyJSON
import RealmSwift

class ToDoListViewController: UIViewController, FSCalendarDelegate, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    fileprivate let caseCellIdentifier = "caseIdentifier"
    fileprivate let nibNameString = "CaseTableViewCell"
    let realm = try! Realm()
    var incomeCases = [Case]()
    var timeArray = [Date]()
    var dayCasesArray = [Case]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNib()
        createTimeArray()
    }
    //MARK:- Working with calendar
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        //Get items from JSON
        dayCasesArray = [Case]()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dayString = formatter.string(from: date)
        let dayNumber = Int(dayString)
        dayCasesArray = getCasesByDay(dayNumber!)
        
        //Get items from Realm
        var items: Results<Case>
        items = realm.objects(Case.self)
        for item in items {
            if item.day_id == dayNumber! {
                dayCasesArray.append(item)
            }
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    //MARK:- Working with JSON
    func getCasesByDay(_ day_id: Int) -> [Case] {
        let filePath = Bundle.main.path(forResource: "Data", ofType: "json")!
        var dayCasesArray = [Case]()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            incomeCases = try JSONDecoder().decode([Case].self, from: data)
            
        }
        catch{
            print(error)
        }
        for item in incomeCases{
            if item.day_id == day_id {
                dayCasesArray.append(item)
            }
        }
        return dayCasesArray
    }
    
    func createTimeArray() {
        for i in 0...23{
            var dateComponents = DateComponents()
            dateComponents.hour = i
            dateComponents.minute = 00
            let userCalendar = Calendar.current // user calendar
            guard let someDateTime = userCalendar.date(from: dateComponents) else { return }
            timeArray.append(someDateTime)
        }
    }
    
    
    //MARK:- Working with tableview
    
    func registerNib() {
        let nib = UINib(nibName: nibNameString, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: caseCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeArray.count
    }
    
    func checkCaseIsInTheRange(caseLeftHour: Int, caseRightHour: Int) -> (String, String) {
        var dateStart = 0
        var dateFinish = 0
        print(dayCasesArray)
        for item in dayCasesArray {
            if String(item.caseDateStart).count > 2 {
                dateStart = Date(timeIntervalSince1970: Double(Int(item.caseDateStart))).time.hour
                dateFinish = Date(timeIntervalSince1970: Double(Int(item.caseDateFinish))).time.hour
                print(caseLeftHour,dateStart, caseRightHour, dateFinish)
            } else {
                dateStart = item.caseDateStart
                dateFinish = item.caseDateFinish
                print(caseLeftHour, dateStart,caseRightHour, dateFinish)
            }
            if dateStart >= caseLeftHour && dateFinish < caseRightHour  {
                return (item.caseName, item.caseDescription)
            }
            
//            let dateStart = Date(timeIntervalSince1970: Double(Int(item.caseDateStart)))
//            let dateFinish = Date(timeIntervalSince1970: Double(Int(item.caseDateFinish)))
//            print(caseLeftHour,dateStart.time.hour, caseRightHour, dateFinish.time.hour)
//            if dateStart.time.hour >= caseLeftHour && dateFinish.time.hour < caseRightHour  {
//                return (item.caseName, item.caseDescription)
            }
        return ("","")
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: caseCellIdentifier, for: indexPath) as! CaseTableViewCell
        cell.caseHoursLabel.text = String(timeArray[indexPath.row].time.hour) + ":" + String(timeArray[indexPath.row].time.minute) + "0 - " + String(timeArray[indexPath.row].time.hour + 1) + ":" + String(timeArray[indexPath.row].time.minute) + "0"
        let (name,_) = checkCaseIsInTheRange(caseLeftHour: timeArray[indexPath.row].time.hour, caseRightHour: timeArray[indexPath.row].time.hour + 1)
        cell.caseNameLabel.text = name
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let caseLeftHour = timeArray[indexPath.row].time.hour
        let caseRightHour = timeArray[indexPath.row].time.hour + 1
        let (name,description) = checkCaseIsInTheRange(caseLeftHour: caseLeftHour, caseRightHour: caseRightHour)
        let caseDescriptionArray = [name,description, String(timeArray[indexPath.row].time.hour) + ":" + String(timeArray[indexPath.row].time.minute) + "0 - " + String(timeArray[indexPath.row].time.hour + 1) + ":" + String(timeArray[indexPath.row].time.minute) + "0"]
        
        performSegue(withIdentifier: "segue", sender: caseDescriptionArray)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailCaseViewController {
            vc.destArray = sender as! [String]
            
        }
    }
}
