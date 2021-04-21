//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Олег Филатов on 12.02.2021.
//

import Foundation



class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?

    var profiles = [Profile(name: "Ivan", secondName: "Akulov", age: 35),
                    Profile(name: "Max", secondName: "Kolby", age: 21),
                    Profile(name: "Mark", secondName: "Salmon", age: 55)]
    
    func numberOfRows() -> Int {
        return profiles.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
