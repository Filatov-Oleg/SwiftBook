//
//  ViewModel.swift
//  MVVM-1
//
//  Created by Олег Филатов on 11.02.2021.
//

import Foundation

class ViewModel {
    private var profile = Profile(name: "Ivan", secondName: "Akulov", age: 34)
    
    var name: String {
        return profile.name
    }
    
    var secondName: String {
        return profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
}
