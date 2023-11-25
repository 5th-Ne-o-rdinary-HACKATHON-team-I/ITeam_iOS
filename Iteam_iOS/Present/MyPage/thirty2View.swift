//
//  thirty2View.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import UIKit

class thirty2View: UIView {
    let mangeTitleLabel = UILabel().then {
       $0.text = "바람직하게 소비하기"
        $0.textColor = UIColor(hexString: "#FD442B")
       $0.font = UIFont.body1
       $0.sizeToFit()
   }
    let mangeSubLabel = UILabel().then {
       $0.text = "적절한 금액을 분배하여 소비를 효율적으로 관리해봐요"
        $0.textColor = .darkGray
       $0.font = UIFont.caption3
       $0.sizeToFit()
   }
    private let infoSV = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    private let priceSV = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    private let monthEarnLabel = UILabel().then {
        $0.text = "이번달 수입"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthHalboLabel = UILabel().then {
        $0.text = "고정 지출 내역"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthSubLabel = UILabel().then {
        $0.text = "추천 저축가격"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthPinLabel = UILabel().then {
        $0.text = "추천식비가격"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthEarnPrice = UILabel().then {
        $0.text = "3000000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthHalboPrice = UILabel().then {
        $0.text = "100000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthSubPrice = UILabel().then {
        $0.text = "1050000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthPinPrice = UILabel().then {
        $0.text = "1200000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let lastLabel = UILabel().then {
        $0.text = "남은 가격"
        $0.textColor = .darkGray
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let lastPrice = UILabel().then {
        $0.text = "650000".formatPriceWithWon()
        $0.textColor = .darkGray
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private func layout() {
        self.mangeSubLabel.snp.makeConstraints {
            $0.top.equalTo(self.mangeTitleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
        }
        self.mangeTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        self.priceSV.snp.makeConstraints {
            $0.top.equalTo(self.mangeSubLabel.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-20)
        }
        self.infoSV.snp.makeConstraints {
            $0.top.equalTo(self.mangeSubLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(mangeSubLabel)
        self.addSubview(mangeTitleLabel)
        self.addSubview(infoSV)
        self.addSubview(priceSV)
        self.infoSV.addArrangedSubview(monthEarnLabel)
        self.infoSV.addArrangedSubview(monthHalboLabel)
        self.infoSV.addArrangedSubview(monthSubLabel)
        self.infoSV.addArrangedSubview(monthPinLabel)
        self.infoSV.addArrangedSubview(lastLabel)
        self.priceSV.addArrangedSubview(monthEarnPrice)
        self.priceSV.addArrangedSubview(monthHalboPrice)
        self.priceSV.addArrangedSubview(monthSubPrice)
        self.priceSV.addArrangedSubview(monthPinPrice)
        self.priceSV.addArrangedSubview(lastPrice)
        self.layout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
