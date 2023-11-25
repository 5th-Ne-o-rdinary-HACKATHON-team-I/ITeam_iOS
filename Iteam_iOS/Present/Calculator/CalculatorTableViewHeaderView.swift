//
//  CalcylatorTableViewHeaderView.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/25.
//

import UIKit
import SnapKit

class CalculatorTableViewHeaderView: UITableViewHeaderFooterView {
    // 섹션 헤더에 사용할 커스텀 뷰 클래스 정의
    
    lazy var view: UIView = UIView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        // 커스텀 뷰의 구성 요소들을 설정
        addSubview(view)
        
        view.backgroundColor = .white
        
        // Autolayout 설정
        view.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
