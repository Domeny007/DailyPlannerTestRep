//
//  CaseModel.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 21.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation
import RealmSwift

class Case: Object, Decodable{
    @objc dynamic var day_id: Int = 0
    @objc dynamic var caseName: String = ""
    @objc dynamic var caseDateStart: Int = 0
    @objc dynamic var caseDateFinish: Int = 0
    @objc dynamic var caseDescription:String = ""
}
