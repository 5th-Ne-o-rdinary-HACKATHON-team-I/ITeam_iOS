//
//  HomeViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit
import Lottie
import AVFoundation

class HomeViewController: BaseViewController {
    
    private let scrollView = UIScrollView()
    
    private let contentView = UIView().then {
        $0.backgroundColor = UIColor(hexString: "#F7F7F7")
    }
    
    private let cherImg = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .clear
        $0.tintColor = .white
    }
    
    private func playVideo(with resourceName: String) {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "mp4") else {
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = profileImg.bounds
        profileImg.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = .resizeAspectFill
        player.play()
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "아름다운 구속"
        $0.textColor = UIColor(hexString: "#FF3E23")
        $0.font = .pretendard(.Bold, size: 24)
        $0.sizeToFit()
    }
    
    private let btnSV = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 16
    }
    
    private let bellBtn = UIButton().then {
        $0.setImage(UIImage(named: "Alert"), for: .normal)
    }
    private let profileBtn = UIButton().then {
        $0.setImage(UIImage(named: "Profile"), for: .normal)
    }
    
    private let profileView = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let profileImg = UIImageView().then {
        $0.image = UIImage(named: "_레이어_1 1")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .clear
    }
    private let goBtn = UIButton().then {
        $0.setTitle("내역 관리하러 가기", for: .normal)
        $0.titleLabel?.font = UIFont.caption2
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
        $0.backgroundColor = UIColor(hexString: "#FD442B")
    }
    private let charNameLabel = UILabel().then {
        $0.text = "파산이"
        $0.textColor = UIColor(hexString: "#FD442B")
        $0.font = UIFont.subTitle1
        $0.sizeToFit()
    }
    private let perLabel = UILabel().then {
        $0.text = "소득대비 고정지출 비율 80%"
        $0.textColor = .black
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let calBtn = UIView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = UIColor(hexString: "#808080")
    }
    private let calLabel = UILabel().then {
        $0.text = "할부 이자 계산기"
        $0.textColor = .white
        $0.font = UIFont.body1
        $0.sizeToFit()
    }
    private let calSubLabel = UILabel().then {
        $0.text = "할부 이자 계산기"
        $0.textColor = .white
        $0.font = UIFont.caption3
        $0.sizeToFit()
    }
    private let calLabelSV = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
    }
    private let calImg = UIImageView().then {
        $0.image = UIImage(named: "aad")
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .clear
    }
    private let halbooView = bodyView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    private let subView = bodyView().then {
        $0.layer.cornerRadius = 15
        $0.layer.shadowRadius = 10
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowColor = UIColor(hexString: "#000000").cgColor
        $0.layer.shadowOpacity = 0.08
        $0.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        DispatchQueue.main.async { [weak self] in
             self?.playVideo(with: "pasan")
         }

         DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.5) { [weak self] in
             self?.playVideo(with: "pasan")
         }
    }
    
    override func configure() {
        self.halbooView.tableview.delegate = self
        self.subView.tableview.delegate = self
        self.halbooView.tableview.dataSource = self
        self.subView.tableview.dataSource = self
        self.halbooView.goBtn.addTarget(self, action:#selector(halbooBtnTap), for: .touchUpInside)
        self.subView.goBtn.addTarget(self, action:#selector(subBtnTap), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileBtnTap))
        self.profileView.addGestureRecognizer(tapGesture)
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func addview() {
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(btnSV)
        self.contentView.addSubview(titleLabel)
        self.btnSV.addArrangedSubview(bellBtn)
        self.btnSV.addArrangedSubview(profileBtn)
        self.contentView.addSubview(profileView)
        self.profileView.addSubview(perLabel)
        self.profileView.addSubview(charNameLabel)
        self.profileView.addSubview(profileImg)
        self.profileView.addSubview(goBtn)
        self.contentView.addSubview(calBtn)
        self.calBtn.addSubview(calImg)
        self.calBtn.addSubview(calLabelSV)
        self.calLabelSV.addArrangedSubview(calLabel)
        self.calLabelSV.addArrangedSubview(calSubLabel)
        self.contentView.addSubview(halbooView)
        self.contentView.addSubview(subView)
        self.calBtn.addSubview(cherImg)
    }
    
    override func layout() {
        self.cherImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(calLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(24)
        }
        self.goBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(125)
            $0.height.equalTo(21)
        }
        self.subView.snp.makeConstraints {
            $0.top.equalTo(halbooView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(364)
        }
        self.halbooView.snp.makeConstraints {
            $0.top.equalTo(calBtn.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(364)
        }
        self.calImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().offset(-16)
            $0.width.height.equalTo(55)
        }
        self.calLabelSV.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16)
        }
        self.calBtn.snp.makeConstraints {
            $0.top.equalTo(profileView.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(68)
        }
        
        self.scrollView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.left.right.bottom.equalToSuperview()
        }
        self.contentView.snp.makeConstraints {
            $0.width.equalToSuperview().offset(0)
            $0.edges.equalToSuperview().offset(0)
            $0.height.equalTo(1200)
        }
        self.titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.leading.equalToSuperview().offset(16)

        }
        self.btnSV.snp.makeConstraints {
            $0.top.top.equalToSuperview().offset(29)
            $0.trailing.equalToSuperview().offset(-19)
        }
        self.bellBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        self.profileBtn.snp.makeConstraints {
            $0.width.height.equalTo(24)
        }
        self.profileView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(231)
        }
        self.profileImg.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(170)
        }
        self.charNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(perLabel.snp.top)
            $0.leading.equalTo(profileImg.snp.trailing).offset(20)
        }
        self.perLabel.snp.makeConstraints {
            $0.bottom.equalTo(goBtn.snp.top).offset(-8)
            $0.leading.equalTo(profileImg.snp.trailing).offset(20)
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
extension HomeViewController {
    @objc func halbooBtnTap() {
        let vc = DetailHalbooViewController()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func subBtnTap() {
        let vc = DetailSubViewController()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func profileBtnTap() {
        let vc = MyViewController()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
