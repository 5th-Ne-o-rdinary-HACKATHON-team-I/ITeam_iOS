//
//  HomeViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#F7F7F7")
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "아름다운 구속"
        $0.textColor = UIColor(hexString: "#FF3E23")
        $0.font = .pretendard(.Bold, size: 24)
        $0.sizeToFit()
    }
    
    private let btnSV = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let bellBtn = UIButton().then {
        $0.setImage(UIImage(named: "Alert"), for: .normal)
    }
    private let profileBtn = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    
    private let profileView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let profileImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .systemGray
    }
    private let charNameLabel = UILabel().then {
        $0.text = "파산이"
        $0.textColor = .black
        $0.font = UIFont.subTitle1
        $0.sizeToFit()
    }
    private let perLabel = UILabel().then {
        $0.text = "소득대비 고정지출 비율 80%"
        $0.textColor = .black
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let calBtn = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = UIColor(hexString: "#FF644F")
    }
    private let calLabel = UILabel().then {
        $0.text = "할부 이자 계산기"
        $0.textColor = .white
        $0.font = UIFont.body1
        $0.sizeToFit()
    }
    private let calSubLabel = UILabel().then {
        $0.text = "할부 이자 계산기"
        $0.textColor = .white
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let calLabelSV = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    private let calImg = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .systemGray
    }
    private let halbooView = bodyView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    override func configure() {
        
    }
    
    override func addview() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(btnSV)
        self.contentView.addSubview(titleLabel)
        self.btnSV.addArrangedSubview(bellBtn)
        self.btnSV.addArrangedSubview(profileBtn)
        self.contentView.addSubview(profileView)
        self.profileView.addSubview(perLabel)
        self.profileView.addSubview(charNameLabel)
        self.profileView.addSubview(profileImg)
        self.contentView.addSubview(calBtn)
        self.calBtn.addSubview(calImg)
        self.calBtn.addSubview(calLabelSV)
        self.calLabelSV.addArrangedSubview(calLabel)
        self.calLabelSV.addArrangedSubview(calSubLabel)
    }
    
    override func layout() {
        self.calImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(55)
        }
        self.calLabelSV.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
        }
        self.calBtn.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(68)
        }
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.bottom.equalToSuperview()
        }
        self.contentView.snp.makeConstraints {
            $0.width.equalToSuperview().offset(0)
            $0.edges.equalToSuperview().offset(0)
            $0.height.equalTo(1242)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(25)
            $0.leading.equalToSuperview().offset(16)

        }
        self.btnSV.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(29)
            $0.trailing.equalToSuperview().offset(-19)
        }
        self.bellBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        self.profileBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        self.profileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(231)
        }
        self.profileImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(21)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(130)
        }
        self.charNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImg.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        self.perLabel.snp.makeConstraints {
            $0.top.equalTo(charNameLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
}
