//
//  DefaultKeys.swift
//  HeroicDose
//


import Foundation
import SwiftyUserDefaults



extension UserDefaults {
    subscript(key: DefaultsKey<[Song]?>) -> [Song]? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
}

extension DefaultsKeys {
    static let songs = DefaultsKey<[Song]?>("favouritedSongs")
}
