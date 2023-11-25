//
//  ViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit
import Then
import SnapKit

class ViewController: BaseViewController {
    private let textfield = UITextField().then {
        $0.layer.borderColor = UIColor(hexString: "#111111").cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
    }
    private let textfield2 = UITextField().then {
        $0.layer.borderColor = UIColor(hexString: "#111111").cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
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
        self.view.addSubview(textfield2)
    }
    
    override func layout() {
        self.textfield.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
        }
        self.textfield2.snp.makeConstraints {
            $0.top.equalTo(self.textfield.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(100)
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
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textfield {
            showTextfield2()
        }
        return true
    }
}
