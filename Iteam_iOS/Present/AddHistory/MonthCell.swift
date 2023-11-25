//
//  CardCell.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/26.
//

import UIKit

class MonthCell: UITableViewCell {

    // UI 요소들을 정의합니다.
    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.body2
        label.textColor = UIColor(named: "gray03")
        label.textAlignment = .center
        return label
    }()
    
    // 셀을 초기화하고 UI를 설정하는 메서드입니다.
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    // 이니셜라이저가 구현되어 있어야 합니다.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UI를 설정하는 메서드입니다.
    private func configureUI() {
        addSubview(label)
        
        // SnapKit을 사용하여 레이아웃을 설정합니다.
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        }
    }

}
