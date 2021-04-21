//
//  DetailViewControllerTests.swift
//  TDDappTests
//
//  Created by Олег Филатов on 05.04.2021.
//

import XCTest
import CoreLocation
@testable import TDDapp

class DetailViewControllerTests: XCTestCase {
    var sut: DetailViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.sut = storyboard.instantiateViewController(identifier: String(describing: DetailViewController.self)) as? DetailViewController
        self.sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasTitleLabel() {
        XCTAssertNotNil(self.sut.titleLabel)
        XCTAssertTrue(self.sut.titleLabel.isDescendant(of: self.sut.view))
    }
    
    func testHasDescriptionLabel() {
        XCTAssertNotNil(self.sut.descriptionLabel)
        XCTAssertTrue(self.sut.descriptionLabel.isDescendant(of: self.sut.view))
    }
    
    func testHasDateLabel() {
        XCTAssertNotNil(self.sut.dateLabel)
        XCTAssertTrue(self.sut.dateLabel.isDescendant(of: self.sut.view))
    }
    
    func testHasLocationLabel() {
        XCTAssertNotNil(self.sut.locationLabel)
        XCTAssertTrue(self.sut.locationLabel.isDescendant(of: self.sut.view))
    }
    
    func testHasMapView() {
        XCTAssertNotNil(self.sut.mapView)
        XCTAssertTrue(self.sut.mapView.isDescendant(of: self.sut.view))
    }
    
    func setupTaskAndAppearanceTransition() {
        let coordinate = CLLocationCoordinate2D(latitude: 55.675874, longitude: 37.875283)
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1546300800)
        let task = Task(title: "Foo", description: "Bar", date: date, location: location)
        
        sut.task = task
        
        sut.beginAppearanceTransition(true, animated: true) //viewWillAppear
        sut.endAppearanceTransition() // viewDidAppear
        
    }
    
    func testSettingTaskSetsTitleLabel() {
        self.setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.titleLabel.text, "Foo")
        
    }
    
    
    func testSettingTaskSetsDescriptionLabel() {
        self.setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.descriptionLabel.text, "Bar")
    }
    
    func testSettingTaskSetsLocationLabel() {
        self.setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.locationLabel.text, "Baz")
    }
    
    func testSettingTaskSetsDateLabel() {
        self.setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.dateLabel.text, "01.01.19")
    }
    
    func testSettingTaskSetsMapViewl() {
        self.setupTaskAndAppearanceTransition()
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, 55.675874, accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, 37.875283, accuracy: 0.001)
    }
}
