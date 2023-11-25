//
//  DetailSubViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class DetailSubViewController: BaseViewController {
    private let titleLabel = UILabel().then {
        $0.text = "11월 할부 결제 내역"
        $0.textColor = UIColor(hexString: "#FF3E23")
        $0.font = UIFont.body1
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
       $0.font = UIFont.title2
       $0.sizeToFit()
   }
    private let priceSortBtn = UIButton().then {
        $0.setTitle("결제금액순", for: .normal)
        $0.setTitleColor(UIColor(hexString: "#808080"), for: .normal)
        $0.titleLabel?.font = UIFont.caption3
    }
    private let dateSortBtn = UIButton().then {
        $0.setTitle("결제일순", for: .normal)
        $0.titleLabel?.font = UIFont.caption3
        $0.setTitleColor(UIColor(hexString: "#808080"), for: .normal)
    }
    private let lastSortBtn = UIButton().then {
        $0.setTitle("잔여기간순", for: .normal)
        $0.titleLabel?.font = UIFont.caption3
        $0.setTitleColor(UIColor(hexString: "#808080"), for: .normal)
    }
    private let spaceLabel = UILabel().then {
        $0.text = "|"
       $0.textColor = UIColor(hexString: "#808080")
       $0.font = UIFont.caption3
       $0.sizeToFit()
   }
    private let spaceLabel2 = UILabel().then {
        $0.text = "|"
       $0.textColor = UIColor(hexString: "#808080")
       $0.font = UIFont.caption3
       $0.sizeToFit()
   }
    private let tableview = UITableView(frame: CGRect.zero, style: .grouped).then{
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
    
    override func configure() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.view.backgroundColor = .white
    }
    
    override func addview() {
        self.view.addSubview(subLabel)
        self.view.addSubview(priceLabel)
        self.view.addSubview(titleLabel)
        self.view.addSubview(spaceLabel)
        self.view.addSubview(spaceLabel2)
        self.view.addSubview(priceSortBtn)
        self.view.addSubview(dateSortBtn)
        self.view.addSubview(lastSortBtn)
        self.view.addSubview(tableview)
    }
    
    override func layout() {
        self.tableview.snp.makeConstraints {
            $0.top.equalTo(self.priceSortBtn.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
        }
        self.priceSortBtn.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(24)
            $0.trailing.equalTo(spaceLabel2.snp.leading).offset(-4)
            $0.width.equalTo(52)
            $0.height.equalTo(21)
        }
        self.spaceLabel2.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(26)
            $0.trailing.equalTo(dateSortBtn.snp.leading).offset(-4)
        }
        self.dateSortBtn.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(24)
            $0.trailing.equalTo(spaceLabel.snp.leading).offset(-4)
            $0.width.equalTo(52)
            $0.height.equalTo(21)
        }
        self.spaceLabel.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(26)
            $0.trailing.equalTo(lastSortBtn.snp.leading).offset(-4)
        }
        self.lastSortBtn.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.equalTo(52)
            $0.height.equalTo(21)
        }
        self.priceLabel.snp.makeConstraints {
            $0.top.equalTo(self.subLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(16)
        }
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(4)
            $0.leading.equalToSuperview().offset(16)
        }
    }
}
extension DetailSubViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
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

