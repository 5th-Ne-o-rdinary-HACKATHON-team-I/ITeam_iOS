//
//  thirtyView.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import UIKit

class thirtyView: UIView {
    
    let pinTitleLabel = UILabel().then {
       $0.text = "고정 지출 내역 비교"
        $0.textColor = .black
       $0.font = UIFont.body1
       $0.sizeToFit()
   }
    let pinSubLabel = UILabel().then {
       $0.text = "월급 대비 이번달 고정 지출 내역에 \n 20만원을 더 썻어요."
        $0.textColor = .darkGray
        $0.numberOfLines = 0
       $0.font = UIFont.caption2
        let attributedStr = NSMutableAttributedString(string: $0.text!)
        attributedStr.addAttribute(.foregroundColor, value: UIColor(hexString: "#FD442B"), range: ($0.text! as NSString).range(of: "20만원"))
        attributedStr.addAttribute(.font, value: UIFont.subTitle1, range: ($0.text! as NSString).range(of: "20만원"))

        $0.attributedText = attributedStr
       $0.sizeToFit()
   }
    
    private let avgPrice  = UILabel().then {
        $0.text = "10만원"
         $0.textColor = .lightGray
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let yourPrice  = UILabel().then {
        $0.text = "31만원"
         $0.textColor = .black
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let avg  = UILabel().then {
        $0.text = "평균"
         $0.textColor = .lightGray
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let your  = UILabel().then {
        $0.text = "\(UserInfo.shared.name)님"
         $0.textColor = .black
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let avgView = UIView().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .lightGray
    }
    private let yourView = UIView().then {
        $0.layer.cornerRadius = 8
        $0.backgroundColor = UIColor(hexString: "#FD442B")
    }
    private let avgSV = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .center
    }
    private let youSV = UIStackView().then {
        $0.alignment = .center
        $0.axis = .vertical
        $0.spacing = 4
    }
    
    private func layout() {
        self.pinSubLabel.snp.makeConstraints {
            $0.top.equalTo(pinTitleLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
        }
        self.pinTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        self.avgSV.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.trailing.equalTo(youSV.snp.leading).offset(-12)
        }
        self.youSV.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        self.avgView.snp.makeConstraints {
            $0.width.equalTo(55)
            $0.height.equalTo(39)
        }
        self.yourView.snp.makeConstraints {
            $0.width.equalTo(55)
            $0.height.equalTo(82)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(pinSubLabel)
        self.addSubview(pinTitleLabel)
        self.addSubview(avg)
        self.addSubview(avgView)
        self.addSubview(avgPrice)
        self.addSubview(your)
        self.addSubview(yourView)
        self.addSubview(yourPrice)
        self.addSubview(avgSV)
        self.addSubview(youSV)
        self.avgSV.addArrangedSubview(avgPrice)
        self.avgSV.addArrangedSubview(avgView)
        self.avgSV.addArrangedSubview(avg)
        self.youSV.addArrangedSubview(yourPrice)
        self.youSV.addArrangedSubview(yourView)
        self.youSV.addArrangedSubview(your)

        self.layout()

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
}
