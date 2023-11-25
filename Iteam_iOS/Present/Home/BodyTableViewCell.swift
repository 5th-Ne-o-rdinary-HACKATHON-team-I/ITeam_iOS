//
//  BodyTableViewCell.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit

class BodyTableViewCell: UITableViewCell {
    
    static let identifier = "BodyTableViewCell"
    
    private let img = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .systemGray
    }
    private let productLabel = UILabel().then {
        $0.text = "상품명"
        $0.textColor = .black
        $0.font = UIFont.body2
        $0.sizeToFit()
    }
    private let priceLabel = UILabel().then {
        $0.text = "100000".formatPriceWithWon()
        $0.textColor = .black
        $0.font = UIFont.body2
        $0.sizeToFit()
    }
    private let subLabel = UILabel().then {
        $0.text = "납품횟수/할부 개월 수"
        $0.textColor = UIColor(hexString: "#808080")
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let dateLabel = UILabel().then {
        $0.text = "2023년 11월 3일"
        $0.textColor = UIColor(hexString: "#808080")
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    
    private func addview() {
        self.addSubview(img)
        self.addSubview(productLabel)
        self.addSubview(priceLabel)
        self.addSubview(dateLabel)
        self.addSubview(subLabel)
    }
    
    private func layout() {
        self.dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.priceLabel.snp.bottom)
            $0.trailing.equalToSuperview().offset(-20)
        }
        self.subLabel.snp.makeConstraints {
            $0.top.equalTo(self.productLabel.snp.bottom)
            $0.leading.equalTo(self.img.snp.trailing).offset(12)
        }
        self.priceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().offset(-20)
        }
        self.productLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(4)
            $0.leading.equalTo(self.img.snp.trailing).offset(12)
        }
        self.img.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureCell(_ halboo:Bool) {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addview()
        self.layout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addview()
        self.layout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
