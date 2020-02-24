//
//  URLSession + NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Austin Potts on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation


// We dont have access to the source for the URLSession but we can extend its functionality

extension URLSession: NetworkDataLoader{
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        
        dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        
    }
    
    
}
