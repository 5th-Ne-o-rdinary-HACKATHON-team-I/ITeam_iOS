//
//  UserInfo.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    var name: String?
    var email: String?
    var earn: Int?
    
    private init() {}
}
