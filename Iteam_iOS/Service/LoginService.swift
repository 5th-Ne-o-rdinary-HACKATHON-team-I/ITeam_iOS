//
//  LoginService.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import Foundation
import Alamofire

class LoginService {
    func postLogin(loginRequsst: LoginRequest,onCompletion: @escaping (UserDTO) -> Void) {
        let url = APIConstants.baseURL + "members/signup"
        AF.request(url, method: .post,parameters: loginRequsst.parameters,encoding: JSONEncoding.default)
            .responseDecodable(of: UserDTO.self) { response in
                switch response.result {
                case .success(let data):
                    print(data)
                    onCompletion(data)
                case .failure(let error):
                    print("로그인실패: \(error)")
                }
            }
    }
}
