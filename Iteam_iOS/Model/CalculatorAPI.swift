//
//  CalculatorAPI.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/26.
//

import Foundation
import Moya

enum CalculatorAPI{
    case calcResult(param: CalculatorBodyModel)
}

extension CalculatorAPI: TargetType{
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        return "/installments/calc"
    }
    
    var method: Moya.Method {
        switch self {
        case.calcResult(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self{
        case .calcResult(param: let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "applidation/json"]
    }
    
    
}
