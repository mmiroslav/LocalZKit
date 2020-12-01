//
//  File.swift
//  
//
//  Created by Miroslav Milivojevic on 01/12/2020.
//

import Foundation

class LocalZManager {
    static let shared: LocalZManager = LocalZManager()
    init() {}
    
    var translates = [String: String]()
}


extension String {
    func localized() -> String {
        LocalZManager.shared.translates[self] ?? self
    }
    
//    var localized: String {
//        self.localized()
//    }
}

