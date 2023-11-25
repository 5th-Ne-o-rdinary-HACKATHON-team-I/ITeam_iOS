//
//  bodyView.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class bodyView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.text = "11월 할부 결제내역"
        $0.textColor = .black
        $0.font = UIFont.subTitle2
        $0.sizeToFit()
    }
    
    private func layout() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
