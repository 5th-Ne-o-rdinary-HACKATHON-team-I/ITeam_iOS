//
//  CalculatorModel.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/26.
//

import Foundation


struct CalculatorModel: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: CalResult
}

// MARK: - Result
struct CalResult: Codable {
    let avgPerMonthTotalPay, avgPerMonthInc, totalInc: Int
}




struct CalculatorBodyModel: Codable {
    let totalAmount, monthCount, noIncMonthCount, increateRate: Int
}
