//
//  TableViewCellViewModel.swift
//  MVVM-2
//
//  Created by Олег Филатов on 12.02.2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    var fullName: String {
        return profile.name + " " + profile.secondName
    }
    
    var age: String {
        return String(describing: profile.age)
    }
    
    private var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
    }
    
}
