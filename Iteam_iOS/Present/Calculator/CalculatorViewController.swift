//
//  CalculatorViewController.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/25.
//

import UIKit
import Then
import SnapKit

enum WhichTextField {
    case installmentMonth
    case interestFree
}

class CalculatorViewController: BaseViewController {
    
    
    static let mainRedColor = UIColor(hexString: "FD442B")
    static let gray1 = UIColor(hexString: "F2F2F2")
    static let gray2 = UIColor(hexString: "D9D9D9")
    static let gray3 = UIColor(hexString: "BFBEBE")
    
    var totalAmount: Int = 0
    var monthCount: Int = 0
    var noIncMonthCount: Int = 0
    var increateRate: Int = 0

    
    
    private var tableView: UITableView!
    var whichTextField: WhichTextField = .installmentMonth

    let dateData = ["3 개월", "6 개월", "9 개월", "12 개월", "직접 입력하기"]
    
    
    //제목 라벨
    private let titleLabel = UILabel().then{
        $0.text = "할부 계산기"
        $0.textColor = mainRedColor
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    //할부 금액 라벨
    private let installmentAmountLabel = UILabel().then{
        $0.text = "할부 금액"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    private let installmentAmountTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "0원"
    }
    
    //할부 개월 라벨
    private var installmentMonthLabel = UILabel().then{
        $0.text = "할부 개월"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    //할부 개월 Input Label
    private var installmentMonthInputLabel = UILabel().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.text = "   00개월"
        $0.textColor = .systemGray2
        $0.isUserInteractionEnabled = true
    }
    
    private var installmentMonthTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "00개월"
    }
    
    //무이자 개월 라벨
    private var interestFreeMonthLabel = UILabel().then{
        $0.text = "무이자 개월"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    //무이자 개월 Input Label
    private var interestFreeMonthInputLabel = UILabel().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.text = "   0개월"
        $0.textColor = .systemGray2
        $0.isUserInteractionEnabled = true
    }
    
    private var interestFreeMonthTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "0개월"
    }
    
    //이자율 라벨
    private var interestRateLabel = UILabel().then{
        $0.text = "이자율"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    private var interestRateTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "0.00%"
    }
    
    //계산기 버튼
    private var calculateButton = UIButton().then{
        $0.backgroundColor = mainRedColor
        $0.setTitle("계산하기", for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.Regular, size: 16)
        $0.layer.cornerRadius = 15
        $0.alpha = 0.0
    }
    
    
    
    
    func setTableView(){
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CalculcatorTableViewCell.self, forCellReuseIdentifier: "CalculcatorTableViewCell")
        tableView.register(CalculatorTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "CalculatorTableViewHeaderView")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = CalculatorViewController.gray2.cgColor
        tableView.layer.cornerRadius = 5
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(interestFreeMonthTextField.snp.bottom).offset(4)
            $0.leading.equalTo(interestRateTextField.snp.leading)
            $0.trailing.equalTo(interestRateTextField.snp.trailing)
            $0.height.equalTo(193)
        }
    }
    
    // 라벨을 아래로 이동하는 메서드 _ 할부 개월
    func moveLabelDown_installmentMonth() {
        UIView.animate(withDuration: 0.3) {
            // 원하는 만큼의 이동거리 설정
            self.interestFreeMonthLabel.transform = CGAffineTransform(translationX: 0, y: 210)
            self.interestFreeMonthTextField.transform = CGAffineTransform(translationX: 0, y: 210)
            
            self.interestRateLabel.transform = CGAffineTransform(translationX: 0, y: 210)
            self.interestRateTextField.transform = CGAffineTransform(translationX: 0, y: 210)
            
        }
    }

    // 라벨을 위로 이동하는 메서드 _ 할부 개월
    func moveLabelUp_installmentMonth() {
        UIView.animate(withDuration: 0.3) {
            // 초기 위치로 이동
            self.interestFreeMonthLabel.transform = .identity
            self.interestFreeMonthTextField.transform = .identity
            
            self.interestRateLabel.transform = .identity
            self.interestRateTextField.transform = .identity
        }
    }
    
    // 라벨을 아래로 이동하는 메서드 _ 무이자 개월
    func moveLabelDown_interestFreeMonth() {
        UIView.animate(withDuration: 0.3) {
            // 원하는 만큼의 이동거리 설정
            self.interestRateLabel.transform = CGAffineTransform(translationX: 0, y: 210)
            self.interestRateTextField.transform = CGAffineTransform(translationX: 0, y: 210)
        }
    }

    // 라벨을 위로 이동하는 메서드 _ 무이자 개월
    func moveLabelUp_interestFreeMonth() {
        UIView.animate(withDuration: 0.3) {
            // 초기 위치로 이동
            self.interestRateLabel.transform = .identity
            self.interestRateTextField.transform = .identity
        }
    }
    
    
    //fadeIn _ 할부 개월
    func fadeIn_installmentMonth(duration: TimeInterval = 1.0) {
        
        tableView.removeFromSuperview()
        self.view.addSubview(tableView)
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CalculcatorTableViewCell.self, forCellReuseIdentifier: "CalculcatorTableViewCell")
        tableView.register(CalculatorTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "CalculatorTableViewHeaderView")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = CalculatorViewController.gray2.cgColor
        tableView.layer.cornerRadius = 5
        tableView.alpha = 0.0
        self.view.addSubview(tableView)
        
        self.whichTextField = .installmentMonth
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(installmentMonthTextField.snp.bottom).offset(4)
            $0.leading.equalTo(installmentMonthTextField.snp.leading)
            $0.trailing.equalTo(installmentMonthTextField.snp.trailing)
            $0.height.equalTo(193)
            
        }
        
        UIView.animate(withDuration: duration, animations: {
            self.tableView.alpha = 1.0
        })
    }
    
    //fadeIn _ 무이자 개월
    func fadeIn_interestFreeMonth(duration: TimeInterval = 1.0) {
        
        tableView.removeFromSuperview()
        self.view.addSubview(tableView)
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CalculcatorTableViewCell.self, forCellReuseIdentifier: "CalculcatorTableViewCell")
        tableView.register(CalculatorTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "CalculatorTableViewHeaderView")
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = CalculatorViewController.gray2.cgColor
        tableView.layer.cornerRadius = 5
        tableView.alpha = 0.0
        self.view.addSubview(tableView)
        
        self.whichTextField = .interestFree
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(interestFreeMonthTextField.snp.bottom).offset(4)
            $0.leading.equalTo(installmentMonthTextField.snp.leading)
            $0.trailing.equalTo(installmentMonthTextField.snp.trailing)
            $0.height.equalTo(193)
            
        }
        
        UIView.animate(withDuration: duration, animations: {
            self.tableView.alpha = 1.0
        })
    }
    
    func fadeIn_calculateButton(duration: TimeInterval = 1.0){
        UIView.animate(withDuration: duration, animations: {
            self.calculateButton.alpha = 1.0
        })
    }
    
 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        tableView.alpha = 0.0
        self.view.backgroundColor = .white
    }
    
    override func configure() {
        installmentAmountTextField.delegate = self
        installmentMonthTextField.delegate = self
        interestFreeMonthTextField.delegate = self
        interestRateTextField.delegate = self
        
        
        
        //할부 개월
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(labelTapped1(_:)))
        installmentMonthInputLabel.addGestureRecognizer(tapGesture1)
        
        //무이자 개월
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(labelTapped2(_:)))
        interestFreeMonthInputLabel.addGestureRecognizer(tapGesture2)
        
        calculateButton.addTarget(self, action: #selector(moveToResultView), for: .touchUpInside)
        
    }
    
    @objc func labelTapped1(_ sender: UITapGestureRecognizer){
        
        self.moveLabelDown_installmentMonth()
        self.fadeIn_installmentMonth(duration: 0.5)
    }
    
    @objc func labelTapped2(_ sender: UITapGestureRecognizer){
        
        self.moveLabelDown_interestFreeMonth()
        self.fadeIn_interestFreeMonth(duration: 0.5)
    }
    
    @objc func moveToResultView(){
        
        let viewController = CalculateResultViewController()
        
        var calBodyModel = CalculatorBodyModel(totalAmount: totalAmount, monthCount: monthCount, noIncMonthCount: noIncMonthCount, increateRate: increateRate)
        
        CalculatorManager.shared.getCalculateResult(calcBodyModel: calBodyModel, completion: { result in
            switch result {
            case .success(let data):
                print(data)
                viewController.wonLabel.text = "\(data.result.avgPerMonthTotalPay)"
                viewController.resultDetailLabel_1.text = "\(data.result.avgPerMonthTotalPay)"
                viewController.explainDetailLabel_2.text = "\(data.result.avgPerMonthInc)"
                viewController.explainDetailLabel_3.text = "\(data.result.totalInc)"
                
                
                viewController.resultFinalLabel_1.text = self.installmentAmountTextField.text
                viewController.resultFinalLabel_2.text = self.installmentMonthTextField.text
                viewController.resultFinalLabel_3.text = self.interestFreeMonthTextField.text
                viewController.resultFinalLabel_4.text = self.interestRateTextField.text
            case . failure(let error):
                print(error)
                return
            }
            
        })
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func addview() {
        self.view.addSubview(titleLabel) //제목 라벨
        
        self.view.addSubview(installmentAmountLabel) //할부 금액 라벨
        self.view.addSubview(installmentAmountTextField)
        
        self.view.addSubview(installmentMonthLabel) //할부 개월 라벨
        self.view.addSubview(installmentMonthTextField)
        self.view.addSubview(installmentMonthInputLabel)
        
        self.view.addSubview(interestFreeMonthLabel) //무이자 개월 라벨
        self.view.addSubview(interestFreeMonthTextField)
        self.view.addSubview(interestFreeMonthInputLabel)
        
        self.view.addSubview(interestRateLabel) //이자율 라벨
        self.view.addSubview(interestRateTextField)
        
        self.view.addSubview(calculateButton)//계산 버튼
        
    }
    
    override func layout() {
        
        //제목 라벨
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(21)
        }
        
        //할부 금액 라벨
        installmentAmountLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(21)
        }
        
        installmentAmountTextField.snp.makeConstraints{
            $0.top.equalTo(installmentAmountLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        //할부 개월 라벨
        installmentMonthLabel.snp.makeConstraints{
            $0.top.equalTo(installmentAmountTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(21)
        }
        
        installmentMonthTextField.snp.makeConstraints{
            $0.top.equalTo(installmentMonthLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        installmentMonthInputLabel.snp.makeConstraints{
            $0.top.equalTo(installmentMonthLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        //무이자 개월 라벨
        interestFreeMonthLabel.snp.makeConstraints{
            $0.top.equalTo(installmentMonthTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(21)
        }
        
        interestFreeMonthTextField.snp.makeConstraints{
            $0.top.equalTo(interestFreeMonthLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        interestFreeMonthInputLabel.snp.makeConstraints{
            $0.top.equalTo(interestFreeMonthLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        //이쟈율 라벨
        interestRateLabel.snp.makeConstraints{
            $0.top.equalTo(interestFreeMonthTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(21)
        }
        
        interestRateTextField.snp.makeConstraints{
            $0.top.equalTo(interestRateLabel.snp.bottom).offset(8)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(37)
        }
        
        //계산 버튼
        calculateButton.snp.makeConstraints{
            $0.height.equalTo(37)
            $0.width.equalTo(316)
            $0.leading.equalToSuperview().offset(37)
            $0.top.equalTo(interestRateTextField.snp.bottom).offset(20)
        }
    }
}

extension CalculatorViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
        textField.layer.borderColor = CalculatorViewController.gray3.cgColor
        textField.layer.borderWidth = 1
    }
    

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.layer.borderWidth = 0
            textField.backgroundColor = CalculatorViewController.gray1
        }
        
        else if textField == installmentAmountTextField {
            self.totalAmount = Int(textField.text!)!
            installmentAmountTextField.text = textField.text!.formatPriceWithWon()
        }
        
        
        
        else if textField == installmentMonthLabel {
            self.monthCount = Int(textField.text!)!
            installmentMonthInputLabel.text = "   " + textField.text! + " 개월"
            installmentMonthInputLabel.isHidden = false
            textField.isHidden = true
            moveLabelUp_installmentMonth()
            tableView.alpha = 0.0
        }
        
        else if textField == interestFreeMonthTextField {
            self.noIncMonthCount = Int(textField.text!)!
            interestFreeMonthInputLabel.text = "   " + textField.text! + " 개월"
            interestFreeMonthInputLabel.isHidden = false
            textField.isHidden = true
            moveLabelUp_interestFreeMonth()
            tableView.alpha = 0.0
        }
        
        else if textField == interestRateTextField{
            self.increateRate = Int(textField.text!)!
            
            interestRateTextField.text = textField.text! + "%"
        }
        
        if interestRateTextField.text != "" {
            self.fadeIn_calculateButton()
        }
        
        
    }
}

extension CalculatorViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용 가능한 셀 얻기
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculcatorTableViewCell", for: indexPath) as! CalculcatorTableViewCell
        cell.dateLabel.text = dateData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    //헤더뷰
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CalculatorTableViewHeaderView") as! CalculatorTableViewHeaderView
        return headerView
    }
    
    //푸터뷰
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CalculatorTableViewHeaderView") as! CalculatorTableViewHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        4
    }
    
    //cell 크기
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height - 8) / CGFloat(dateData.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath) as! CalculcatorTableViewCell
        cell.dateLabel.textColor = .black
        
        let date = dateData[indexPath.row]
        
        switch self.whichTextField{
        case .installmentMonth:
            if date == "직접 입력하기"{
                installmentMonthTextField.isUserInteractionEnabled = true
                installmentMonthInputLabel.isHidden = true
                moveLabelUp_installmentMonth()
                tableView.alpha = 0.0
            }
            else{
                installmentMonthInputLabel.text = "   " + date
                installmentMonthInputLabel.backgroundColor = .white
                installmentMonthInputLabel.textColor = .black
                installmentMonthInputLabel.layer.borderWidth = 1
                installmentMonthInputLabel.layer.borderColor = CalculatorViewController.gray3.cgColor
                
                moveLabelUp_installmentMonth()
                tableView.alpha = 0.0
                self.view.endEditing(true)
            }
        
        case .interestFree:
            if date == "직접 입력하기"{
                interestFreeMonthTextField.isUserInteractionEnabled = true
                interestFreeMonthInputLabel.isHidden = true
                moveLabelUp_interestFreeMonth()
                tableView.alpha = 0.0
            }
            else{
                interestFreeMonthInputLabel.text = "   " + date
                interestFreeMonthInputLabel.backgroundColor = .white
                interestFreeMonthInputLabel.textColor = .black
                interestFreeMonthInputLabel.layer.borderWidth = 1
                interestFreeMonthInputLabel.layer.borderColor = CalculatorViewController.gray3.cgColor
                
                moveLabelUp_interestFreeMonth()
                tableView.alpha = 0.0
                self.view.endEditing(true)
            }
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview: PreviewProvider {
    static var previews: some View {
        CalculatorViewController().showPreView(.iPhone12Pro)
    }
}
#endif

