//
//  APIClient.swift
//  TDDapp
//
//  Created by Олег Филатов on 22.04.2021.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol  {}

class APIClient {
    lazy var urlSession: URLSessionProtocol = URLSession.shared
    
    func login(withName name: String, password: String, completionHandler: @escaping (String?, Error?) -> Void) {
        
        let allowedCharacters = CharacterSet.urlQueryAllowed
//        URLFragmentAllowedCharacterSet  "#%<>[\]^`{|}
//        URLHostAllowedCharacterSet      "#%/<>?@\^`{|}
//        URLPasswordAllowedCharacterSet  "#%/:<>?@[\]^`{|}
//        URLPathAllowedCharacterSet      "#%;<>?[\]^`{|}
//        URLQueryAllowedCharacterSet     "#%<>[\]^`{|}
//        URLUserAllowedCharacterSet      "#%/:<>?@[\]^`
        guard let name = name.addingPercentEncoding(withAllowedCharacters: allowedCharacters), let password = password.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else { fatalError() }

        let query = "name=\(name)&password=\(password)"
        guard let url = URL(string: "https://TDDapp.com/login?\(query)") else {
            fatalError()
        }
        urlSession.dataTask(with: url) { (data, response, error) in
            
        }.resume()
    }
    
}

