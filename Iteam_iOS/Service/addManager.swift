//
//  addManager.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/26.
//

import Foundation
import Moya

class addManager {
    private init() {}
    static let shared = addManager()
    lazy var provider = MoyaProvider<addAPI>()
    
    func addList(installmentData: Installment, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.addInstallment(param: installmentData)) { result in
            switch result {
            case .success(let data) :
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error) :
                completion(.failure(Error))
            }
        }
    }
    
    func addSubscribeList(subscribeData: Subscribe, completion: @escaping (Result<[String : Any], Error>) -> Void) {
        provider.request(.addSubscribe(param: subscribeData)) { result in
            switch result {
            case .success(let data) :
                if let json = try? JSONSerialization.jsonObject(with: data.data, options: []) as? [String : Any] {
                    completion(.success(json))
                }
            case .failure(let Error) :
                completion(.failure(Error))
            }
        }
    }
}
