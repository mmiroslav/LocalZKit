//
//  File.swift
//  
//
//  Created by Miroslav Milivojevic on 01/12/2020.
//

import Foundation

public extension String {
    func localized() -> String {
        LocalZManager.shared.translates[self] ?? self
    }
    
    var localz: String {
        self.localized()
    }
}
