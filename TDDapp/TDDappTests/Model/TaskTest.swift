//
//  TaskTest.swift
//  TDDappTests
//
//  Created by Олег Филатов on 14.03.2021.
//

import XCTest
@testable import TDDapp

class TaskTest: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        XCTAssertNotNil(task)
    }

    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenDescriptionSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
//        XCTAssertEqual(task.description, "Bar") //или так
        XCTAssertTrue(task.description == "Bar")
    }
    
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar",
                        description: "Baz",
                        location: location)
        XCTAssertEqual(location, task.location)
    }
}
