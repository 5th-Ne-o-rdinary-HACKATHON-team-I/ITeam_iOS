//
//  ViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

//  test

import UIKit
import Then
import SnapKit

class ViewController: BaseViewController {
    private let textfield = UITextField().then {
        $0.layer.borderColor = UIColor(hexString: "#111111").cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.textColor = .black
    }
    private let textfield2 = UITextField().then {
        $0.layer.borderColor = UIColor(hexString: "#111111").cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
    }
    private let img = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .clear
        $0.image = UIImage(named: "Watcha")
    }
    
    private let label = UILabel().then {
        $0.text = "assfsf"
        $0.font = .pretendard(.Bold, size: 23)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    override func configure() {
        self.view.backgroundColor = .white
        self.textfield2.isHidden = true
        self.textfield.delegate = self
    }
    
    override func addview() {
        self.view.addSubview(label)
        self.view.addSubview(textfield)
        self.view.addSubview(img)
    }
    
    override func layout() {
        self.textfield.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        self.img.snp.makeConstraints {
            $0.top.equalTo(self.textfield.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        self.label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    func showTextfield2() {
        self.textfield2.alpha = 0.0
        self.textfield2.isHidden = false

        UIView.animate(withDuration: 2, animations: {
            self.textfield2.alpha = 1.0
        })
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let img = Iteam_iOS.test(rawValue: textField.text ?? "")?.image {
            self.img.image = UIImage(named: img)
        }
        else {
            self.img.image = UIImage(named: "")
        }
        
        // 텍스트에 맞는 이미지 이름 가져오기
        //        if let imageName = Iteam_iOS.test(rawValue: textField.text ?? "")?.image {
        //            self.img.image = UIImage(named: imageName)
        //        } else {
        //            // 처리할 로직 추가: 예를 들어, 적절한 디폴트 이미지를 설정하거나 에러 처리 등
        //            self.img.image = UIImage(named: "DefaultImage")
        //        }
        //    }
    }
    
}
