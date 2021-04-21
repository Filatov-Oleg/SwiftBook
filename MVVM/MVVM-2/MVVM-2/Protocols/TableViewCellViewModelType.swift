//
//  TableViewCellViewModelType.swift
//  MVVM-2
//
//  Created by Олег Филатов on 12.02.2021.
//

import Foundation

protocol TableViewCellViewModelType: class {
    var fullName: String { get }
    var age: String { get }
}
