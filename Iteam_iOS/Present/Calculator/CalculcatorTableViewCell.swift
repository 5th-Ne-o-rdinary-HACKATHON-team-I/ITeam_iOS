//
//  CalculcatorTableViewCell.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/25.
//

import UIKit
import Foundation
import SnapKit

class CalculcatorTableViewCell: UITableViewCell{
    
    lazy var view: UIView = UIView()
    
    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.pretendard(.Regular, size: 16)
        label.text = "3 개월"
        label.textColor = CalculatorViewController.gray3
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(view)
        view.addSubview(dateLabel)
        
        view.snp.makeConstraints{
            $0.height.equalToSuperview()
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(4)
            $0.bottom.equalToSuperview().offset(-4)
            $0.centerX.equalToSuperview()
        }
    }
}

class tableViewHeaderView: UIView {
    lazy var view: UIView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
