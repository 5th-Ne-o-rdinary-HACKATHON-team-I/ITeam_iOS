//
//  LoginModel.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let email: String
    let price: Int

    var parameters: [String: Any] {
         return [
             "username": username,
             "email": email,
             "price": price
         ]
     }
}

struct UserDTO: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result

    struct Result: Codable {
        let createdAt: String
        let updatedAt: String
        let id: Int
        let name: String
        let email: String
        let accountStatus: String
        let installments: [Installment]
        let subscribes: [Subscribe]
        let expenses: [Expense]
        let notifications: [Notification]
    }

    struct Installment: Codable {
        let createdAt: String
        let updatedAt: String
    }

    struct Subscribe: Codable {
        let createdAt: String
        let updatedAt: String
        let id: Int
        let serviceName: String
        let monthlyFee: Double
        let billingDay: Int
        let member: String
        let category: String
    }

    struct Expense: Codable {
        let createdAt: String
        let updatedAt: String
    }

    struct Notification: Codable {
        let createdAt: String
        let updatedAt: String
    }
}
