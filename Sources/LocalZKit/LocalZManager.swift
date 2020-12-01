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
    public var currentLocale: Locale = .en {
        didSet {
            updateCurrentTranslates(with: currentLocale)
        }
    }
    public var version: String = "0.0.0"
    
    // MARK: Private

    private let userDefaultsBaseKey = "translatesDict.locale."
    
    // MARK: - Version

    public func isLatestVersion(_ latest: String) -> Bool {
        self.version.compare(latest, options: .numeric) != .orderedAscending
    }
    
    // MARK: - Translates
    
    public func setTranslates(translates: Dictionary<String, String>, locale: Locale) {
        UserDefaults.standard.setValue(translates, forKey: userDefaultsBaseKey + locale.rawValue)
    }
}

private extension LocalZManager {
    
    func updateCurrentTranslates(with locale: Locale) {
        self.translates = self.fetchTranslates(for: locale)
    }
    
    func fetchTranslates(for locale: Locale) -> Dictionary<String, String> {
        if let translates = UserDefaults.standard.value(forKey: userDefaultsBaseKey + locale.rawValue) as? Dictionary<String, String> {
            return translates
        }
        return [:]
    }
}


