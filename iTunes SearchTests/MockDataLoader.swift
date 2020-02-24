//
//  MockDataLoader.swift
//  iTunes SearchTests
//
//  Created by Austin Potts on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
@testable import iTunes_Search

class MockDataLoader: NetworkDataLoader {
    
    
    
    
    var data: Data?
    
    var error: Error?
    
     var response: URLResponse?
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.data, self.response, self.error)
        }
    }
    
    
    
}
