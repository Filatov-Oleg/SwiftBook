//
//  DetailViewModelType.swift
//  MVVM-2
//
//  Created by Олег Филатов on 12.02.2021.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
