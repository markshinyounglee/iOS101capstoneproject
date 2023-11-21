//
//  LoginInfo.swift
//  iOS101CapstoneGoFindChurch
//
//  Created by Shinyoung Lee on 11/20/23.
//

import Foundation

let defaults = UserDefaults.standard
let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct LoginInfo: Codable, Equatable {
    var name: String?
    var age: String?
    var affiliation: String?
    var id: String?
    var pw: String?
}

extension LoginInfo {
    // make custom initializer to ease member creation
    // https://www.logilax.com/swift-struct-init/
    init(_ csv: String) {
        let infos = csv.components(separatedBy: ",")
        self.name = infos[0]
        self.age = infos[1]
        self.affiliation = infos[2]
        self.id = infos[3]
        self.pw = infos[4]
    }
    
    static var codingKey = "ProfileInfo"
    
    static func save(_ info: [LoginInfo]) {
        guard let newInfo = try? encoder.encode(info) else {
            print("encoding failed")
            return
        }
        defaults.set(newInfo, forKey: codingKey)
        print("\(info) successfully saved")
    }
    
    static func get(forKey key: String) -> [LoginInfo] {
        let data = defaults.data(forKey: codingKey)
        if data == nil {
            print("decoding failed - 1")
            return []
        }
        guard let decodedInfo = try? decoder.decode(LoginInfo.self, from: data!) else {
            print("decoding failed - 2")
            return []
        }
        print("\(decodedInfo) successfully retrieved")
        return [decodedInfo]
    }
}
