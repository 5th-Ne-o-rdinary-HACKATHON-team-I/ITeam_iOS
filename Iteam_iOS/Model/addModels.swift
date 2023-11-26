//
//  addModels.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/26.
//

import Foundation
// MARK: - Installment
struct Installment: Codable {
    let memberID: Int
    let cardCompany, memo: String
    let interestRate: Double
    let startDate: String
    let monthCount, billingDay, totalAmount: Int
}

// MARK: - Subscribe
struct Subscribe: Codable {
    let memberID: Int
    let cardCategory: String
    let monthlyFee, billingDay: Int
    let serviceName: String
}
