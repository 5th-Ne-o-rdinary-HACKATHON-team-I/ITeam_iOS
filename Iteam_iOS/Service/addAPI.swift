//
//  addAPI.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/26.
//

import Foundation
import Moya

enum addAPI {
    case addInstallment(param: Installment)
    case addSubscribe(param: Subscribe)
}

extension addAPI: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .addInstallment(param: _):
            return "/installments"
        case .addSubscribe(param: _):
            return "/subscribes"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addInstallment(param: _):
            return .post
        case .addSubscribe(param: _):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addInstallment(param: let param):
            return .requestJSONEncodable(param)
        case .addSubscribe(param: let param):
            return .requestJSONEncodable(param)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
