//
//  MyViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class MyViewController: BaseViewController {
    private let scrollView = UIScrollView()
    
    private let contentView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#F7F7F7")
    }
    private let analyzeView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let managementView = thirty2View().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let img = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    private let charNameLabel = UILabel().then {
        $0.text = "파산이"
        $0.textColor = .black
        $0.font = UIFont.subTitle1
        $0.sizeToFit()
    }
    let titleLabel = UILabel().then {
       $0.text = "적자관리"
        $0.textColor = UIColor(hexString: "#FD442B")
       $0.font = UIFont.body1
       $0.sizeToFit()
   }
    let subLabel = UILabel().then {
       $0.text = "아름다운 거지님의 소득대비 지출 퍼센트는"
       $0.textColor = UIColor(hexString: "#A6A6A6")
       $0.font = UIFont.caption3
       $0.sizeToFit()
   }
    private let perLabel = UILabel().then {
        $0.text = "45%"
        $0.textColor = .black
        $0.font = UIFont.title1
        $0.sizeToFit()
    }
    private let distroyLabel = UILabel().then {
        $0.text = "파산"
        $0.textColor = UIColor(hexString: "#FD442B")
        $0.font = UIFont.subTitle1
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
        $0.text = "이번달 할부 내역"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthSubLabel = UILabel().then {
        $0.text = "이번달 구독 내역"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthPinLabel = UILabel().then {
        $0.text = "이번달 고정 지출 내역"
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthEarnPrice = UILabel().then {
        $0.text = "30000000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthHalboPrice = UILabel().then {
        $0.text = "30000000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthSubPrice = UILabel().then {
        $0.text = "30000000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let monthPinPrice = UILabel().then {
        $0.text = "30000000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption2
        $0.sizeToFit()
    }
    private let progressView = UIProgressView().then {
        $0.tintColor = UIColor(hexString: "#FD442B")
        $0.trackTintColor = UIColor(hexString: "#D9D9D9")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.progress = 0.45
    }
    private let bottomLabel = UILabel().then {
        $0.text = "안전한 자산 관리를 위해 줄일 비용"
        $0.textColor = .black
        $0.font = UIFont.caption1
        $0.sizeToFit()
    }
    private let bottomPrice = UILabel().then {
        $0.text = "25000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.caption1
        $0.sizeToFit()
    }
    
    private let thrity = thirtyView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let doneBtn = UIButton().then {
        $0.setTitle("수입 변경하기", for: .normal)
        $0.titleLabel?.font = UIFont.caption2
        $0.tintColor = .white
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(hexString: "#FD442B")
        
    }


    override func configure() {
        self.doneBtn.addTarget(self, action:#selector(doneBtnTap), for: .touchUpInside)

    }
    
    override func addview() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(analyzeView)
        self.contentView.addSubview(managementView)
        self.analyzeView.addSubview(distroyLabel)
        self.analyzeView.addSubview(perLabel)
        self.analyzeView.addSubview(subLabel)
        self.analyzeView.addSubview(titleLabel)
        self.analyzeView.addSubview(charNameLabel)
        self.analyzeView.addSubview(img)
        self.analyzeView.addSubview(infoSV)
        self.analyzeView.addSubview(progressView)
        self.infoSV.addArrangedSubview(monthEarnLabel)
        self.infoSV.addArrangedSubview(monthHalboLabel)
        self.infoSV.addArrangedSubview(monthSubLabel)
        self.infoSV.addArrangedSubview(monthPinLabel)
        self.analyzeView.addSubview(priceSV)
        self.priceSV.addArrangedSubview(monthEarnPrice)
        self.priceSV.addArrangedSubview(monthHalboPrice)
        self.priceSV.addArrangedSubview(monthSubPrice)
        self.priceSV.addArrangedSubview(monthPinPrice)
        self.analyzeView.addSubview(bottomLabel)
        self.analyzeView.addSubview(bottomPrice)
        self.contentView.addSubview(thrity)
        self.contentView.addSubview(doneBtn)
    }
    
    override func layout() {
        self.doneBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-15)
            $0.height.equalTo(42)
            $0.horizontalEdges.equalToSuperview().inset(24)
        }
        self.thrity.snp.makeConstraints {
            $0.top.equalTo(analyzeView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(211)
        }
        self.bottomPrice.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-19)
            $0.trailing.equalToSuperview().offset(-20)

        }
        self.bottomLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-19)
            $0.leading.equalToSuperview().offset(20)

        }
        self.priceSV.snp.makeConstraints {
            $0.top.equalTo(self.progressView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().offset(-20)
        }
        self.infoSV.snp.makeConstraints {
            $0.top.equalTo(self.progressView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(20)
        }
        self.progressView.snp.makeConstraints {
            $0.top.equalTo(self.distroyLabel.snp.bottom).offset(10)
            $0.height.equalTo(18)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        self.distroyLabel.snp.makeConstraints {
            $0.top.equalTo(img.snp.bottom).offset(118)
            $0.trailing.equalToSuperview().offset(-18)
        }
        self.perLabel.snp.makeConstraints {
            $0.top.equalTo(subLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(20)
        }
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(20)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(charNameLabel.snp.bottom).offset(24)
            $0.leading.equalToSuperview().offset(20)
        }
        self.charNameLabel.snp.makeConstraints {
            $0.top.equalTo(img.snp.bottom).offset(19)
            $0.centerX.equalToSuperview()

        }
        self.img.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(150)
            $0.width.equalTo(321)
        }
        self.analyzeView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(529)
        }
        self.managementView.snp.makeConstraints {
            $0.top.equalTo(thrity.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(211)
        }
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.bottom.equalToSuperview()
        }
        self.contentView.snp.makeConstraints {
            $0.width.equalToSuperview().offset(0)
            $0.edges.equalToSuperview().offset(0)
            $0.height.equalTo(1100)
        }    }
}
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BodyTableViewCell.identifier, for: indexPath) as! BodyTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42.0 + 16.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
}
extension MyViewController {
    @objc func doneBtnTap() {
        let vc = PopupViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc,animated: false,completion: nil)
    }
}
