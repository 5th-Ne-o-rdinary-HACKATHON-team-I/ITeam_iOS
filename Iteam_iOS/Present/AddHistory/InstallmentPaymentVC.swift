//
//  InstallmentPaymentVC.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/25.
//

import UIKit
import SnapKit

class InstallmentPaymentVC: BaseViewController {
    //MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    private let titleLabel = UILabel().then {
        $0.text = "할부 결제 내역 등록"
        $0.font = .body1
        $0.textColor = UIColor(named: "main00")
    }
    
    // 카드사 정보
    private let companyTitleLabel = UILabel().then {
        $0.text = "카드사 정보"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let companyContent = PaddingLabel().then {
        $0.text = "카드사 선택"
        $0.font = .body1
        $0.textColor = UIColor(named: "gray03")
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private let CellID = "CardCell"
    private let cardList = ["haha", "hoho"]
    private let tableViewContainer = UIView().then {
        $0.backgroundColor = UIColor(named: "white")
        $0.isHidden = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray02")?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let tableView = UITableView().then {
        $0.isHidden = true
    }
    
    private lazy var companyVStack = UIStackView(arrangedSubviews: [self.companyTitleLabel, self.companyContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 할부 금액
    private let moneyTitleLabel = UILabel().then {
        $0.text = "할부 금액"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let moneyTextfield = UITextField().then {
        $0.font = .body1
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.attributedPlaceholder = NSAttributedString(string: "금액 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "gray03")!,
                                                                                  NSAttributedString.Key.font : UIFont.body1!])
        $0.addLeftPadding(padding: 12)
    }
    
    private lazy var moneyVStack = UIStackView(arrangedSubviews: [self.moneyTitleLabel, self.moneyTextfield]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    
    // 할부 개월
    private let durationTitleLabel = UILabel().then {
        $0.text = "할부 개월"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let durationContent = PaddingLabel().then {
        $0.text = "할부 개월 선택"
        $0.font = .body1
        $0.textColor = UIColor(named: "gray03")
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private lazy var durationVStack = UIStackView(arrangedSubviews: [self.durationTitleLabel, self.durationContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 이자율
    private let rateTitleLabel = UILabel().then {
        $0.text = "이자율"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let rateTextfield = UITextField().then {
        $0.font = .body1
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.attributedPlaceholder = NSAttributedString(string: "이자율 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "gray03")!,
                                                                                  NSAttributedString.Key.font : UIFont.body1!])
        $0.addLeftPadding(padding: 12)
    }
    
    private lazy var rateVStack = UIStackView(arrangedSubviews: [self.rateTitleLabel, self.rateTextfield]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 결제 날짜
    private let dateTitleLabel = UILabel().then {
        $0.text = "결제 날짜"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let dateContent = PaddingLabel().then {
        $0.text = "결제 날짜 선택"
        $0.font = .body1
        $0.textColor = UIColor(named: "gray03")
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private lazy var dateVStack = UIStackView(arrangedSubviews: [self.dateTitleLabel, self.dateContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 할부 시작 날짜
    private let startTitleLabel = UILabel().then {
        $0.text = "할부 시작 날짜"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let startContent = PaddingLabel().then {
        $0.text = "할부 시작 날짜 선택"
        $0.font = .body1
        $0.textColor = UIColor(named: "gray03")
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private lazy var startVStack = UIStackView(arrangedSubviews: [self.startTitleLabel, self.startContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 할부 날짜 선택 DatePicker
    private let datePickerContainer = UIView().then {
        $0.backgroundColor = UIColor(named: "white")
        $0.isHidden = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray02")?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private lazy var datePicker = UIDatePicker().then {
        var tag = 0
        $0.isHidden = true
        $0.preferredDatePickerStyle = .wheels
        $0.datePickerMode = .date
        $0.locale = Locale(identifier: "ko-KR")
        $0.addTarget(self, action: #selector(completeSelectDate(_:)), for: .valueChanged)
    }
    
    // 구매 상품
    private let objectTitleLabel = UILabel().then {
        $0.text = "구매 상품"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let objectTextfield = UITextField().then {
        $0.font = .body1
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.attributedPlaceholder = NSAttributedString(string: "구매 상품 입력", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "gray03")!,
                                                                                  NSAttributedString.Key.font : UIFont.body1!])
        $0.addLeftPadding(padding: 12)
    }
    
    private lazy var objectVStack = UIStackView(arrangedSubviews: [self.objectTitleLabel, self.objectTextfield]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 등록 완료 버튼
    private let completeButton = UIButton().then {
        $0.setTitle("등록하기", for: .normal)
        $0.titleLabel?.font = .body2
        $0.setTitleColor(UIColor(named: "white"), for: .normal)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(named: "main00")
        
        let Action = UIAction { _ in
            print("할부 결제 내역 등록하기 버튼 클릭")
        }
            
        $0.addAction(Action, for: .touchUpInside)
    }
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의

    override func configure() {
        moneyTextfield.delegate = self
        rateTextfield.delegate = self
        objectTextfield.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CardCell.self, forCellReuseIdentifier: CellID)
        
        companyContent.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(companyContentTapped))
        companyContent.addGestureRecognizer(tapGesture)
        
        startContent.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(startContentTapped))
        startContent.addGestureRecognizer(tapGesture2)
        
    }
    
    override func addview() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleLabel)
        view.addSubview(companyVStack)
        view.addSubview(moneyVStack)
        view.addSubview(durationVStack)
        view.addSubview(rateVStack)
        

        
        view.addSubview(dateVStack)
        view.addSubview(startVStack)
        view.addSubview(objectVStack)
        view.addSubview(completeButton)
        
        view.addSubview(tableViewContainer)
        tableViewContainer.addSubview(tableView)
        
        view.addSubview(datePickerContainer)
        datePickerContainer.addSubview(datePicker)
    }
    
    override func layout() {
        
        titleLabel.snp.makeConstraints { (mc) in
            mc.top.equalTo(self.view.safeAreaLayoutGuide).offset(4)
            mc.left.equalTo(self.view).offset(17)
        }
        
        companyContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        companyVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableViewContainer.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(193)
            mc.top.equalTo(self.companyVStack.snp.bottom).offset(4)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableView.snp.makeConstraints { (mc) in
            mc.edges.equalToSuperview().inset(UIEdgeInsets(top: 4, left: 12, bottom: 4, right: 12))
        }
        
        moneyTextfield.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        moneyVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.companyVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        durationContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        durationVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.moneyVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        rateTextfield.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        rateVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.durationVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        dateContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        dateVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.rateVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        startContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        startVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.dateVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        datePickerContainer.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(178)
            mc.top.equalTo(self.startVStack.snp.bottom).offset(4)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        datePicker.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(178)
            mc.top.left.bottom.right.equalTo(datePickerContainer)
        }

        objectTextfield.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }

        objectVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.startVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }

        completeButton.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-74)
            mc.height.equalTo(37)
            mc.top.equalTo(self.objectVStack.snp.bottom).offset(32)
            mc.left.right.equalTo(self.view).offset(37)
        }
        
    }
    
    // method - 할부 시작 날짜 선택 완료 후 실행 함수
    @objc func completeSelectDate(_ sender: UIDatePicker) {
        if datePicker.tag == 0 {
            startContent.then {
                $0.font = .body1
                $0.textColor = UIColor(named: "black")
                $0.backgroundColor = UIColor(named: "white")
                $0.layer.borderColor = UIColor(named: "gray03")?.cgColor
                $0.layer.cornerRadius = 5
                $0.layer.borderWidth = 1
            }
            datePicker.tag = 1
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy - MM - dd" // 날짜 형식을 원하는 대로 설정
        
        print("선택한 날짜 : \"(dateFormatter.string(from: sender.date))")
        startContent.text = dateFormatter.string(from: sender.date)
    }
    
    // method - 할부 시작 내용 라벨 탭 실행 함수
    @objc func startContentTapped() {
        if datePickerContainer.isHidden && datePicker.isHidden {
            datePickerContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            datePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            datePickerContainer.isHidden = !datePickerContainer.isHidden
            datePicker.isHidden = !datePicker.isHidden
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlDown) {
                self.datePickerContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 178)
                self.datePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 178)
            }
        } else {
            self.datePickerContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 178)
            self.datePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 178)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.datePickerContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.datePicker.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.datePickerContainer.isHidden = !self.datePickerContainer.isHidden
            self.datePicker.isHidden = !self.datePicker.isHidden
        }
        
    }
    
    @objc func companyContentTapped() {
        if tableViewContainer.isHidden && tableView.isHidden {
            tableViewContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableViewContainer.isHidden = !tableViewContainer.isHidden
            tableView.isHidden = !tableView.isHidden
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlDown) {
                self.tableViewContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
                self.tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            }
        } else {
            self.tableViewContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer.isHidden = !self.tableViewContainer.isHidden
            self.tableView.isHidden = !self.tableView.isHidden
        }
    }
    

    // MARK: - Lifecycle
    // 생명주기와 관련된 메서드 (viewDidLoad, viewDidDisappear...)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Helpers
    // TODO: 설정, 데이터처리 등 액션 외의 메서드를 정의
}

// TextField Delegate
extension InstallmentPaymentVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 입력 가능한 문자 제한
        if textField == moneyTextfield {
            let charSet: CharacterSet = {
                let cs = CharacterSet.decimalDigits
                return cs.inverted
            }()
            
            guard string.rangeOfCharacter(from: charSet) == nil else {
                return false
            }
            
        } else if textField == rateTextfield {
            let charSet: CharacterSet = {
                var cs = CharacterSet.decimalDigits
                cs.insert(charactersIn: ".")
                return cs.inverted
            }()
            
            guard string.rangeOfCharacter(from: charSet) == nil else {
                return false
            }
            
        }
        
        // 텍스트 입력창 UI 상태 변화
        if string.isEmpty {
            print("텍스트 삭제")
            guard let text = textField.text else { return true }
            if (text.count - 1) == 0 {
                textField.then {
                    $0.font = .body1
                    $0.layer.cornerRadius = 5
                    $0.layer.borderWidth = 0
                    $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
                    
                    $0.addLeftPadding(padding: 12)
                }
            }
        } else {
            print("\(string)이 텍스트 입력됨")
            textField.then {
                $0.font = .body1
                $0.backgroundColor = UIColor(named: "white")
                $0.layer.borderColor = UIColor(named: "gray03")?.cgColor
                $0.layer.cornerRadius = 5
                $0.layer.borderWidth = 1
                
                $0.addLeftPadding(padding: 12)
            }
        }
        
        //
        
        return true
    }
    
    // TODO: 키보드 올라가고 내려가고에 따라 원화 1. 콤마 찍어주기, 2. 이자율 퍼센트 찍어주기
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == moneyTextfield {
            guard let text = textField.text else { return true }
            if text != "" {
                textField.text = UserDefaults.standard.string(forKey: "moneyText")!
            }
        } else if textField == rateTextfield {
            guard let text = textField.text else { return true }
            if text != "" {
                textField.text = UserDefaults.standard.string(forKey: "rateText")!
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == moneyTextfield {
            guard let text = textField.text else { return }
            UserDefaults.standard.set(text, forKey: "moneyText")
            textField.text = text.formatPriceWithWon()
        } else if textField == rateTextfield {
            guard let text = textField.text else { return }
            UserDefaults.standard.set(text, forKey: "rateText")
            if text != "" {
                textField.text = text + "%"
            }
        }
    }
}

extension InstallmentPaymentVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! CardCell
        
        return cell
    }
}

extension InstallmentPaymentVC: UITableViewDelegate {
    // MARK: - Setting Size of Cells
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 29
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
