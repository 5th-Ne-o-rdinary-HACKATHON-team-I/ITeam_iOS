//
//  LoginViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import UIKit
import KakaoSDKUser

class LoginViewController: BaseViewController {
    
    private let Img = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "char")
    }
    private let kakaoBtn = UIButton().then {
        $0.setImage(UIImage(named: "KaKaoLogin"), for: .normal)
    }
    private let naverBtn = UIButton().then {
        $0.setImage(UIImage(named: "NaverLogin"), for: .normal)
    }
    private let appleBtn = UIButton().then {
        $0.setImage(UIImage(named: "appleLogin"), for: .normal)
    }
    private let infoLabel = UILabel().then {
        $0.text = "소셜 계정을 통해 \n 로그인 또는 회원가입을 진행해 주세요."
        $0.textColor = .darkGray
        $0.font = UIFont.caption2
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    private let btnSV = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
    }

    override func configure() {
        self.naverBtn.addTarget(self, action:#selector(naverLoginTap), for: .touchUpInside)
        self.kakaoBtn.addTarget(self, action:#selector(kakaoLoginTap), for: .touchUpInside)
        self.appleBtn.addTarget(self, action:#selector(appleLoginTap), for: .touchUpInside)
    }
    
    override func addview() {
        self.view.addSubview(Img)
        self.view.addSubview(naverBtn)
        self.view.addSubview(kakaoBtn)
        self.view.addSubview(appleBtn)
        self.view.addSubview(infoLabel)
        self.view.addSubview(btnSV)
        self.btnSV.addArrangedSubview(kakaoBtn)
        self.btnSV.addArrangedSubview(naverBtn)
        self.btnSV.addArrangedSubview(appleBtn)
    }
    
    override func layout() {
        self.infoLabel.snp.makeConstraints {
            $0.top.equalTo(self.btnSV.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        self.btnSV.snp.makeConstraints {
            $0.top.equalTo(self.Img.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        self.Img.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(150)
        }
        self.kakaoBtn.snp.makeConstraints {
            $0.width.height.equalTo(45)
        }
        self.naverBtn.snp.makeConstraints {
            $0.width.height.equalTo(45)
        }
        self.appleBtn.snp.makeConstraints {
            $0.width.height.equalTo(45)
        }
    }
}
extension LoginViewController {
    func kakaoLoginPaser() {
        UserApi.shared.me() {(user, error) in
        if let error = error {
            print(error)
        }
        else {
            print("me() success.")

            let userName = user?.kakaoAccount?.profile?.nickname
            let userEmail = user?.kakaoAccount?.email
            UserInfo.shared.name = "최지철"
            UserInfo.shared.email = "sksk02zja@naver.com"
            let vc = PopupViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc,animated: false,completion: nil)
            if let url = user?.kakaoAccount?.profile?.profileImageUrl,
               let data = try? Data(contentsOf: url) {
                print(data)
            }
        }
    }
    
}
    @objc func kakaoLoginTap(){
        UserApi.shared.loginWithKakaoAccount(prompts:[.Login]) {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                //do something
                _ = oauthToken
                // 어세스토큰 (서버분들 한테 드릴 토큰)
                let accessToken = oauthToken?.accessToken
                // accessToken
                print(accessToken as Any)
                //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
                self.kakaoLoginPaser()
            }
        }
    }
    @objc func naverLoginTap(){
        
    }
    @objc func appleLoginTap(){
        
    }
}
