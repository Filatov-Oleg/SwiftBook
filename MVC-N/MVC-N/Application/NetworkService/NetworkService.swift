//
//  NetworkService.swift
//  MVC-N
//
//  Created by Ivan Akulov on 19/01/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import Foundation

class NetworkService {//Singleton
    
    private init() {}
    
    static let shared = NetworkService()
    
    func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async{
                    completion(json)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
