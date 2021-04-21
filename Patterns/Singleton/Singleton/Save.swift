//
//  Save.swift
//  Singleton
//
//  Created by Олег Филатов on 28.12.2020.
//

class Safe {
    var money = 0
    static let shared = Safe()
    
    private init() {} // private не дает создавать новые экземпляры класса, создаздим один и это будет синглетон (вроде так)
}
