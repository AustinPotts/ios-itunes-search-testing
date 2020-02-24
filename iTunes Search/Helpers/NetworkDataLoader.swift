//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Austin Potts on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

// Create protocol that allows us to decide whether we want to use actual data or mock data

protocol NetworkDataLoader {
    //Q: what do we need for data in/out
    // We pass in request
    // Get back data or error
    
    //We are not concerned with how the adopter of this protocol gets the data back
    // We are just telling it that it needs to provide request
    // and it gets back data, and error in completion 
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
    
}
