//
//  DailyPlannerTestTests.swift
//  DailyPlannerTestTests
//
//  Created by Азат Алекбаев on 20.06.2020.
//  Copyright © 2020 Азат Алекбаев. All rights reserved.
//

import XCTest
@testable import DailyPlannerTest

class DailyPlannerTestTests: XCTestCase {
    
    func testHelloWorld() {
        var helloWorld:String?
        
        XCTAssertNil(helloWorld)
        
        helloWorld = "HelloWorld"
        XCTAssertEqual(helloWorld, "HelloWorld1")
    }

}
