//
//  SaleModel.swift
//  HammerSystem
//
//  Created by Олег Филатов on 08.05.2021.
//

import Foundation

struct SaleModel {
    var nameSale: String
    
    static func makeExample() -> [SaleModel] {
        return [SaleModel(nameSale: "sale1"),
                SaleModel(nameSale: "sale1"),
                SaleModel(nameSale: "sale1"),
                SaleModel(nameSale: "sale1"),
                SaleModel(nameSale: "sale1")]
    }
}
