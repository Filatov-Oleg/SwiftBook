//
//  NewTaskViewController.swift
//  TDDapp
//
//  Created by Олег Филатов on 09.04.2021.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {
    
    
    var taskManager: TaskManager!
    var geocoder = CLGeocoder()
    
    @IBOutlet var titleTextFiled: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    
    @IBAction func save() {
        let titleString = self.titleTextFiled.text
        let locationString = self.locationTextField.text
        let date = self.dateFormatter.date(from: dateTextField.text!)
        let descriptionString = self.descriptionTextField.text
        let addressString = self.addressTextField.text
        
        geocoder.geocodeAddressString(addressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleString!, description: descriptionString, date: date, location: location)
            self.taskManager.add(task: task)
        }
    }
    
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }
}
