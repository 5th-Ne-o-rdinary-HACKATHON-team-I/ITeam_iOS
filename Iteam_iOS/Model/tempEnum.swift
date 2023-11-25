//
//  tempEnum.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import Foundation
import UIKit

enum test:String {
    case netflixEng = "Netflix"
    case netflixKor = "넷플릭스"
    
    var image: String {
        switch self {
        case .netflixEng:  return "Netflix"
        case .netflixKor: return "Netflix"
        }
    }
}
