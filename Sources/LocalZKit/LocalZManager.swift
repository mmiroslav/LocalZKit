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
    public var currentLocale: Locale {
        get {
            getCurrentLocale()
        }
        set {
            setCurrentLocale(newValue)
            updateCurrentTranslates(with: newValue)
        }
    }
    public var version: String {
        get {
            getCurrentVersion()
        }
        set {
            setCurrentVersion(newValue)
        }
    }
    
    public static let loclaZNotificationName = Notification.Name("localz.notification.localeChanged")
    
    // MARK: Private

    private let userDefaultsBaseKey = "localz.translatesDict.locale."
    private let userDefaultsKeyForVersion = "localz.translatesDict.version"
    private let userDefaultsKeyForCurrentLocale = "localz.currentLocale"
    private let defaultVersion = "0.0.0"
    
    // MARK: - Version

    public func isLatestVersion(_ latest: String) -> Bool {
        version.compare(latest, options: .numeric) != .orderedAscending
    }
    
    // MARK: - Translates
    
    public func setTranslates(translates: Dictionary<String, String>, locale: Locale) {
        UserDefaults.standard.setValue(translates, forKey: userDefaultsBaseKey + locale.rawValue)
    }
}

private extension LocalZManager {
    // Translates
    func updateCurrentTranslates(with locale: Locale) {
        translates = fetchTranslates(for: locale)
    }
    
    func fetchTranslates(for locale: Locale) -> Dictionary<String, String> {
        if let translates = UserDefaults.standard.value(forKey: userDefaultsBaseKey + locale.rawValue) as? Dictionary<String, String> {
            return translates
        }
        return [:]
    }
    
    // Version
    func getCurrentVersion() -> String {
        UserDefaults.standard.value(forKey: userDefaultsKeyForVersion)
            as? String ?? defaultVersion
        
    }
    
    func setCurrentVersion(_ version: String) {
        UserDefaults.standard.setValue(version, forKey: userDefaultsKeyForVersion)
    }
    
    // Locale
    func getCurrentLocale() -> Locale {
        if let rawLocale = UserDefaults.standard.value(forKey: userDefaultsKeyForCurrentLocale) as? String {
            return Locale(rawValue: rawLocale) ?? .en
        }
        return .en
    }
    
    func setCurrentLocale(_ locale: Locale) {
        NotificationCenter.default.post(name: Self.loclaZNotificationName, object: nil)
        UserDefaults.standard.setValue(locale.rawValue, forKey: userDefaultsKeyForCurrentLocale)
    }
}


