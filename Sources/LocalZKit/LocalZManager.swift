//
//  File.swift
//  
//
//  Created by Miroslav Milivojevic on 01/12/2020.
//

import Foundation

public class LocalZManager {
    public static let shared: LocalZManager = LocalZManager()
    init() {}
    
    public var translates = [String: String]()
}


public extension String {
    public func localized() -> String {
        LocalZManager.shared.translates[self] ?? self
    }
    
//    var localized: String {
//        self.localized()
//    }
}

