//
//  String+Extensions.swift
//  TDDapp
//
//  Created by Олег Филатов on 22.04.2021.
//

import Foundation

extension String {
    //Добавление собственных символов для enconding.
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "~!@#$%^&*()-+=[]\\}{,./?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            fatalError()
        }
        return encodedString
    }
}
