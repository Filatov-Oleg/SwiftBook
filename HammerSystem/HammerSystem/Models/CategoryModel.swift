//
//  CategoryModel.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import Foundation

struct CategoryModel {
    var nameCategory: String
    
    static func makeExample() -> [CategoryModel] {
        return [CategoryModel(nameCategory: "Пицца"),
                CategoryModel(nameCategory: "Комбо"),
                CategoryModel(nameCategory: "Десерты"),
                CategoryModel(nameCategory: "Напитки"),
                CategoryModel(nameCategory: "Закуски")]
    }
}
