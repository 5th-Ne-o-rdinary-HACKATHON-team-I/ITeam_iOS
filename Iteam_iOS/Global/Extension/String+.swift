//
//  String+.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import Foundation
import UIKit

extension String{
    
    // MARK: 000,000원추가

    func formatPriceWithWon() -> String {
        guard let number = Double(self) else {
            return self
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        
        var formattedPrice = numberFormatter.string(from: NSNumber(value: number)) ?? self
        formattedPrice += " 원"
        
        return formattedPrice
    }
    
    // MARK: 취소선
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
