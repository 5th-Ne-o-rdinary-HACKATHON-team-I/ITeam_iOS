//
//  SubscribeVC.swift
//  Iteam_iOS
//
//  Created by 장윤정 on 2023/11/26.
//

import UIKit

class SubscribeVC: BaseViewController {
    //MARK: - Properties
    // 변수 및 상수, IBOutlet
    
    private let titleLabel = UILabel().then {
        $0.text = "구독 결제 내역 등록"
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
    private let cardList = ["농협카드",
                            "농협BC카드",
                            "롯데카드",
                            "삼성카드",
                            "시티카드",
                            "우리카드",
                            "하나카드",
                            "현대카드",
                            "BC카드",
                            "IBK기업은행",
                            "JB카드",
                            "KB국민카드",
                            "SC은행"]
    private let tableViewContainer1 = UIView().then {
        $0.backgroundColor = UIColor(named: "white")
        $0.isHidden = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray02")?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let tableView1 = UITableView().then {
        $0.isHidden = true
        $0.separatorStyle = .none
    }
    
    private lazy var companyVStack = UIStackView(arrangedSubviews: [self.companyTitleLabel, self.companyContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 구독 금액
    private let moneyTitleLabel = UILabel().then {
        $0.text = "구독 금액"
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
    
    private let dateList = ["1일", "2일", "3일", "4일", "5일", "6일", "7일", "8일", "9일", "10일", "11일", "12일", "13일", "14일", "15일", "16일", "17일", "18일", "19일", "20일", "21일", "22일", "23일", "24일", "25일", "26일", "27일", "28일", "막일"]
    
    private let tableViewContainer2 = UIView().then {
        $0.backgroundColor = UIColor(named: "white")
        $0.isHidden = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray02")?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let tableView2 = UITableView().then {
        $0.isHidden = true
        $0.separatorStyle = .none
    }
    
    // 구매 상품
    private let objectTitleLabel = UILabel().then {
        $0.text = "구매 상품"
        $0.font = .body1
        $0.textColor = UIColor(named: "black")
    }
    
    private let objectContent = PaddingLabel().then {
        $0.text = "카드사 선택"
        $0.font = .body1
        $0.textColor = UIColor(named: "gray03")
        $0.backgroundColor = UIColor(named: "gray03")!.withAlphaComponent(0.2)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }

    private let subscribeList = ["Netflix", "YouTube Premium", "KakaoTalk", "naver", "DisneyPlus"]
    private let tableViewContainer3 = UIView().then {
        $0.backgroundColor = UIColor(named: "white")
        $0.isHidden = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "gray02")?.cgColor
        $0.layer.cornerRadius = 5
    }
    
    private let tableView3 = UITableView().then {
        $0.isHidden = true
        $0.separatorStyle = .none
    }
    
    private lazy var objectVStack = UIStackView(arrangedSubviews: [self.objectTitleLabel, self.objectContent]).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 8
    }
    
    // 등록 완료 버튼
    private lazy var completeButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("등록하기", for: .normal)
        button.titleLabel?.font = .body2
        button.layer.cornerRadius = 15
        button.setTitleColor(UIColor(named: "white"), for: .normal)
        button.backgroundColor = UIColor(named: "main00")
        
        let Action = UIAction { _ in
            print("할부 결제 내역 등록하기 버튼 클릭")
            if self.companyContent.text != "" && self.moneyTextfield.text != "" && self.dateContent.text != "" && self.objectContent.text != "" {
                print("가능")

                let addData: Subscribe = Subscribe(memberID: 9,
                                                   cardCategory: UserDefaults.standard.string(forKey: "cardCategory")!,
                                                   monthlyFee: UserDefaults.standard.integer(forKey: "monthlyFee"),
                                                   billingDay: UserDefaults.standard.integer(forKey: "billingDay"),
                                                   serviceName: UserDefaults.standard.string(forKey: "serviceName")!)
                print(addData)
                addManager.shared.addSubscribeList(subscribeData: addData){ result in
                    switch result {
                    case .success(let data):
                        print(data)
                        if data["isSuccess"] as? Bool == true {
                            print("할부 목록 추가 성공")
                        } else if data["isSuccess"] as? Bool == false {
                            print("할부 목록 추가 실패")
                        }
                    case .failure(let error):
                        print("할부 목록 추가 에러")
                        print(error)
                    }
                }


            } else {
                print("불가능")
            }
        }

        button.addAction(Action, for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Actions
    // IBAction 및 사용자 인터랙션과 관련된 메서드 정의

    override func configure() {
        moneyTextfield.delegate = self
        
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(CardCell.self, forCellReuseIdentifier: CellID)
        
        companyContent.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(companyContentTapped))
        companyContent.addGestureRecognizer(tapGesture)
        
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.register(CardCell.self, forCellReuseIdentifier: CellID)
        
        dateContent.isUserInteractionEnabled = true
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(dateContentTapped))
        dateContent.addGestureRecognizer(tapGesture2)
        
        tableView3.dataSource = self
        tableView3.delegate = self
        tableView3.register(CardCell.self, forCellReuseIdentifier: CellID)
        
        objectContent.isUserInteractionEnabled = true
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(objectContentTapped))
        objectContent.addGestureRecognizer(tapGesture3)
        
    }
    
    override func addview() {
        view.backgroundColor = UIColor(named: "white")
        
        view.addSubview(titleLabel)
        view.addSubview(companyVStack)
        view.addSubview(moneyVStack)

        view.addSubview(dateVStack)
        view.addSubview(objectVStack)
        view.addSubview(completeButton)
        
        view.addSubview(tableViewContainer1)
        tableViewContainer1.addSubview(tableView1)
        
        view.addSubview(tableViewContainer2)
        tableViewContainer2.addSubview(tableView2)
        
        view.addSubview(tableViewContainer3)
        tableViewContainer3.addSubview(tableView3)
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
        
        tableViewContainer1.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(193)
            mc.top.equalTo(self.companyVStack.snp.bottom).offset(4)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableView1.snp.makeConstraints { (mc) in
            mc.top.bottom.equalTo(tableViewContainer1).offset(4)
            mc.left.right.equalTo(tableViewContainer1).offset(12)

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
        
        dateContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }
        
        dateVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.moneyVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableViewContainer2.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(193)
            mc.top.equalTo(self.dateVStack.snp.bottom).offset(4)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableView2.snp.makeConstraints { (mc) in
            mc.top.bottom.equalTo(tableViewContainer2).offset(4)
            mc.left.right.equalTo(tableViewContainer2).offset(12)

        }

        objectContent.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(37)
        }

        objectVStack.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(66)
            mc.top.equalTo(self.dateVStack.snp.bottom).offset(16)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableViewContainer3.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-34)
            mc.height.equalTo(193)
            mc.top.equalTo(self.objectVStack.snp.bottom).offset(4)
            mc.left.right.equalTo(self.view).offset(17)
        }
        
        tableView3.snp.makeConstraints { (mc) in
            mc.top.bottom.equalTo(tableViewContainer3).offset(4)
            mc.left.right.equalTo(tableViewContainer3).offset(12)

        }

        completeButton.snp.makeConstraints { (mc) in
            mc.width.equalTo(self.view).offset(-74)
            mc.height.equalTo(37)
            mc.top.equalTo(self.objectVStack.snp.bottom).offset(32)
            mc.left.right.equalTo(self.view).offset(37)
        }
        
    }
    
    @objc func companyContentTapped() {
        if tableViewContainer1.isHidden && tableView1.isHidden {
            tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableViewContainer1.isHidden = !tableViewContainer1.isHidden
            tableView1.isHidden = !tableView1.isHidden
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlDown) {
                self.tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
                self.tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            }
        } else {
            self.tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer1.isHidden = !self.tableViewContainer1.isHidden
            self.tableView1.isHidden = !self.tableView1.isHidden
        }
    }
    
    @objc func dateContentTapped() {
        if tableViewContainer2.isHidden && tableView2.isHidden {
            tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableViewContainer2.isHidden = !tableViewContainer2.isHidden
            tableView2.isHidden = !tableView2.isHidden
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlDown) {
                self.tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
                self.tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            }
        } else {
            self.tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer2.isHidden = !self.tableViewContainer2.isHidden
            self.tableView2.isHidden = !self.tableView2.isHidden
        }
    }
    
    @objc func objectContentTapped() {
        if tableViewContainer3.isHidden && tableView3.isHidden {
            tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            tableViewContainer3.isHidden = !tableViewContainer3.isHidden
            tableView3.isHidden = !tableView3.isHidden
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlDown) {
                self.tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
                self.tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            }
        } else {
            self.tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer3.isHidden = !self.tableViewContainer3.isHidden
            self.tableView3.isHidden = !self.tableView3.isHidden
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
extension SubscribeVC: UITextFieldDelegate {
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
        
        return true
    }
    
    // TODO: 키보드 올라가고 내려가고에 따라 원화 1. 콤마 찍어주기, 2. 이자율 퍼센트 찍어주기
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == moneyTextfield {
            guard let text = textField.text else { return true }
            if text != "" {
                textField.text = UserDefaults.standard.string(forKey: "monthlyFee")!
            }
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if textField == moneyTextfield {
            guard let text = textField.text else { return }
            UserDefaults.standard.set(text, forKey: "monthlyFee")
            textField.text = text.formatPriceWithWon()
        }
    }
}

extension SubscribeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return cardList.count
        } else if tableView == tableView2 {
            return dateList.count
        } else if tableView == tableView3 {
            return subscribeList.count
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! CardCell
        
        if tableView == tableView1 {
            cell.label.text = cardList[indexPath.row]
        } else if tableView == tableView2 {
            cell.label.text = dateList[indexPath.row]
        } else if tableView == tableView3 {
            cell.label.text = subscribeList[indexPath.row]
        }
        
        return cell
    }
}

extension SubscribeVC: UITableViewDelegate {
    // MARK: - Setting Size of Cells
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 33
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView == tableView1 {
            let selectedText = cardList[indexPath.row]
            
            UserDefaults.standard.set(selectedText, forKey: "cardCategory")
            
            companyContent.then {
                $0.font = .body1
                $0.text = selectedText
                $0.textColor = UIColor(named: "black")
                $0.backgroundColor = UIColor(named: "white")
                $0.layer.borderColor = UIColor(named: "gray03")?.cgColor
                $0.layer.cornerRadius = 5
                $0.layer.borderWidth = 1
            }
            
            self.tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView1.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer1.isHidden = !self.tableViewContainer1.isHidden
            self.tableView1.isHidden = !self.tableView1.isHidden
        } else if tableView == tableView2 {
            let selectedText = dateList[indexPath.row]
            
            UserDefaults.standard.set(indexPath.row+1, forKey: "billingDay")
            
            dateContent.then {
                $0.font = .body1
                $0.text = selectedText
                $0.textColor = UIColor(named: "black")
                $0.backgroundColor = UIColor(named: "white")
                $0.layer.borderColor = UIColor(named: "gray03")?.cgColor
                $0.layer.cornerRadius = 5
                $0.layer.borderWidth = 1
            }
            
            self.tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView2.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer2.isHidden = !self.tableViewContainer2.isHidden
            self.tableView2.isHidden = !self.tableView2.isHidden
        } else if tableView == tableView3 {
            let selectedText = subscribeList[indexPath.row]
            
            UserDefaults.standard.set(selectedText, forKey: "serviceName")
            
            objectContent.then {
                $0.font = .body1
                $0.text = selectedText
                $0.textColor = UIColor(named: "black")
                $0.backgroundColor = UIColor(named: "white")
                $0.layer.borderColor = UIColor(named: "gray03")?.cgColor
                $0.layer.cornerRadius = 5
                $0.layer.borderWidth = 1
            }
            
            self.tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            self.tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 193)
            UIView.animate(withDuration: 0.3, delay: 0.01, options: .transitionCurlUp) {
                self.tableViewContainer3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
                self.tableView3.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-34, height: 0)
            }
            
            self.tableViewContainer3.isHidden = !self.tableViewContainer3.isHidden
            self.tableView3.isHidden = !self.tableView3.isHidden
        }
        
        
    }
}
