//
//  bodyView.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class bodyView: UIView {
    
     let titleLabel = UILabel().then {
        $0.text = "11월 할부 결제내역"
        $0.textColor = .black
        $0.font = UIFont.subTitle2
        $0.sizeToFit()
    }
     let subLabel = UILabel().then {
        $0.text = "아름다운 거지님의 이번달 할부금 결제총액은"
        $0.textColor = UIColor(hexString: "#A6A6A6")
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
     let priceLabel = UILabel().then {
         $0.text = "1234500".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
     let goBtn = UIButton().then {
        $0.setImage(UIImage(systemName:"chevron.right"), for: .normal)
        $0.tintColor = .black
    }
    let tableview = UITableView(frame: CGRect.zero, style: .grouped).then{
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.allowsSelection = true
        $0.bounces = true
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = .zero
        $0.register(BodyTableViewCell.self, forCellReuseIdentifier: BodyTableViewCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let plusBtn = UIButton().then {
        $0.setImage(UIImage(systemName:"plus"), for: .normal)
        $0.tintColor = .black
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(hexString: "#F2F2F2")
        $0.tintColor = .darkGray
    }
    
    private func layout() {
        self.plusBtn.snp.makeConstraints {
            $0.top.equalTo(self.tableview.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(32)
        }
        self.tableview.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(158)
        }
        self.goBtn.snp.makeConstraints {
            $0.top.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        self.priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(20)
        }
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableview)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subLabel)
        self.addSubview(self.priceLabel)
        self.addSubview(self.goBtn)
        self.addSubview(self.tableview)
        self.addSubview(self.plusBtn)
        self.layout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
