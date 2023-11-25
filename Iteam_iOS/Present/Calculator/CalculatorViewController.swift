//
//  CalculatorViewController.swift
//  Iteam_iOS
//
//  Created by 이현호 on 2023/11/25.
//

import UIKit
import Then
import SnapKit

class CalculatorViewController: BaseViewController {
    
    
    static let mainRedColor = UIColor(hexString: "FF3E23")
    static let gray1 = UIColor(hexString: "F2F2F2")
    static let gray2 = UIColor(hexString: "D9D9D9")
    static let gray3 = UIColor(hexString: "BFBEBE")
    
    private var tableView: UITableView!
    

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
    private let installmentMonthLabel = UILabel().then{
        $0.text = "할부 개월"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    private let installmentMonthTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "00개월"
    }
    
    //무이자 개월 라벨
    private let interestFreeMonthLabel = UILabel().then{
        $0.text = "무이자 개월"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    private let interestFreeMonthTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "0개월"
    }
    
    //이자율 라벨
    private let interestRateLabel = UILabel().then{
        $0.text = "이자율"
        $0.textColor = .black
        $0.font = UIFont.pretendard(.Medium, size: 16)
        $0.sizeToFit()
    }
    
    private let interestRateTextField = UITextField().then{
        $0.backgroundColor = gray1
        $0.layer.cornerRadius = 10
        $0.font = UIFont.pretendard(.Regular, size: 16)
        $0.sizeToFit()
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        $0.leftViewMode = .always
        $0.placeholder = "0.00%"
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
    }
    
    override func addview() {
        self.view.addSubview(titleLabel) //제목 라벨
        
        self.view.addSubview(installmentAmountLabel) //할부 금액 라벨
        self.view.addSubview(installmentAmountTextField)
        
        self.view.addSubview(installmentMonthLabel) //할부 개월 라벨
        self.view.addSubview(installmentMonthTextField)
        
        self.view.addSubview(interestFreeMonthLabel) //무이자 개월 라벨
        self.view.addSubview(interestFreeMonthTextField)
        
        self.view.addSubview(interestRateLabel) //이자율 라벨
        self.view.addSubview(interestRateTextField)
        
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
    }
}

extension CalculatorViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
        textField.layer.borderColor = CalculatorViewController.gray3.cgColor
        textField.layer.borderWidth = 1
        
        
        if textField == installmentMonthTextField {
            moveLabelDown_installmentMonth()
            fadeIn_installmentMonth(duration: 0.5)
        }
        
        else if textField == interestFreeMonthTextField {
            moveLabelDown_interestFreeMonth()
            fadeIn_interestFreeMonth(duration: 0.5)
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.layer.borderWidth = 0
            textField.backgroundColor = CalculatorViewController.gray1
        }
        
        if textField == installmentMonthTextField {
            moveLabelUp_installmentMonth()
            tableView.alpha = 0.0
        }
        
        else if textField == interestFreeMonthTextField {
            moveLabelUp_interestFreeMonth()
            tableView.alpha = 0.0
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
        if date == "직접 입력하기"{
            installmentMonthTextField.text = ""
            installmentMonthLabel.becomeFirstResponder()
        }
        else{
            installmentMonthTextField.text = date
        }
    }
}



#if DEBUG
import SwiftUI
struct Preview: UIViewControllerRepresentable {
    
    // 여기 ViewController를 변경해주세요
    func makeUIViewController(context: Context) -> UIViewController {
        CalculatorViewController()
    }
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
}

struct ViewController_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Preview()
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        }
    }
}
#endif
