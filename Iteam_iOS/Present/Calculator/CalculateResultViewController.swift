//
//  CalculateResultViewController.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/26.
//

import UIKit
import Then
import SnapKit


class CalculateResultViewController: BaseViewController{
    //제목 라벨
    let titleLabel = UILabel().then{
        $0.text = "할부 계산기"
        $0.textColor = CalculatorViewController.mainRedColor
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    let explainLabel = UILabel().then{
        $0.text = "입력하신 할부 정보로 계산한 한 달 결제 예상 금액입니다"
        $0.textColor = UIColor.init(hexString: "A6A6A6")
        $0.font = UIFont.pretendard(.Regular, size: 10)
        $0.sizeToFit()
    }
    
    var wonLabel = UILabel().then{
        $0.text = "65,300원"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Medium, size: 32)
        $0.sizeToFit()
    }
    
    //detailLabel
    
    var explainDetailLabel_1 = UILabel().then{
        $0.text = "월별 납부 원금"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultDetailLabel_1 = UILabel().then{
        $0.text = "65,000"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    var explainDetailLabel_2 = UILabel().then{
        $0.text = "월별 납부 이자"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultDetailLabel_2 = UILabel().then{
        $0.text = "300"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    var explainDetailLabel_3 = UILabel().then{
        $0.text = "전체 이자"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultDetailLabel_3 = UILabel().then{
        $0.text = "500"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 13)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    //finalLabel
    
    var explainFinalLabel_1 = UILabel().then{
        $0.text = "할부 금악"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultFinalLabel_1 = UILabel().then{
        $0.text = "12,345,555"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    var explainFinalLabel_2 = UILabel().then{
        $0.text = "할부 개월"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultFinalLabel_2 = UILabel().then{
        $0.text = "12 개월"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    var explainFinalLabel_3 = UILabel().then{
        $0.text = "무이자 개월"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultFinalLabel_3 = UILabel().then{
        $0.text = "3 개월"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    var explainFinalLabel_4 = UILabel().then{
        $0.text = "이자율"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .left
        $0.sizeToFit()
    }
    
    var resultFinalLabel_4 = UILabel().then{
        $0.text = "1.3%"
        $0.textColor = UIColor.black
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.textAlignment = .right
        $0.sizeToFit()
    }
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    override func addview() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(explainLabel)
        self.view.addSubview(wonLabel)
        
        self.view.addSubview(explainDetailLabel_1)
        self.view.addSubview(resultDetailLabel_1)
        self.view.addSubview(explainDetailLabel_2)
        self.view.addSubview(resultDetailLabel_2)
        self.view.addSubview(explainDetailLabel_3)
        self.view.addSubview(resultDetailLabel_3)
        
        self.view.addSubview(explainFinalLabel_1)
        self.view.addSubview(resultFinalLabel_1)
        self.view.addSubview(explainFinalLabel_2)
        self.view.addSubview(resultFinalLabel_2)
        self.view.addSubview(explainFinalLabel_3)
        self.view.addSubview(resultFinalLabel_3)
        self.view.addSubview(explainFinalLabel_4)
        self.view.addSubview(resultFinalLabel_4)
    }
    override func layout() {
        //제목 라벨
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            $0.leading.equalToSuperview().offset(16)
            
        }
        
        explainLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
            
        }
        
        wonLabel.snp.makeConstraints{
            $0.top.equalTo(explainLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(16)
            
        }
        
        //detail Label
        
        explainDetailLabel_1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(wonLabel.snp.bottom).offset(4)
        }
        
        resultDetailLabel_1.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(wonLabel.snp.bottom).offset(4)
        }
        
        explainDetailLabel_2.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultDetailLabel_1.snp.bottom).offset(4)
        }
        
        resultDetailLabel_2.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultDetailLabel_1.snp.bottom).offset(4)
        }
        
        explainDetailLabel_3.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultDetailLabel_2.snp.bottom).offset(4)
        }
        
        resultDetailLabel_3.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultDetailLabel_2.snp.bottom).offset(4)
        }
        
        //finalLabel
        
        explainFinalLabel_1.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(594)
        }
        
        resultFinalLabel_1.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalToSuperview().offset(594)
        }
        
        explainFinalLabel_2.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultFinalLabel_1.snp.bottom).offset(16)
        }
        
        resultFinalLabel_2.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultFinalLabel_1.snp.bottom).offset(16)
        }
        
        explainFinalLabel_3.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultFinalLabel_2.snp.bottom).offset(16)
        }
        
        resultFinalLabel_3.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultFinalLabel_2.snp.bottom).offset(16)
        }
        
        explainFinalLabel_3.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultFinalLabel_2.snp.bottom).offset(16)
        }
        
        resultFinalLabel_3.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultFinalLabel_2.snp.bottom).offset(16)
        }
        
        explainFinalLabel_4.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalTo(resultFinalLabel_3.snp.bottom).offset(16)
        }
        
        resultFinalLabel_4.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-16)
            $0.top.equalTo(resultFinalLabel_3.snp.bottom).offset(16)
        }
        
        
        

        
        
    }
    override func configure() {
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview2: PreviewProvider {
    static var previews: some View {
        CalculateResultViewController().showPreView(.iPhone12Pro)
    }
}
#endif

