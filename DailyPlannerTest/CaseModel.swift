//
//  CaseModel.swift
//  DailyPlannerTest
//
//  Created by Азат Алекбаев on 21.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import Foundation

struct Case: Decodable{
    var day_id: Int
    var name: String
    var id: String
    var date_start: String
    var date_finish: String
    var description:String
}
