//
//  UserSearchVC.swift
//  Peekabook
//
//  Created by devxsby on 2023/01/01.
//

import UIKit

import SnapKit
import Then

import Moya

final class UserSearchVC: UIViewController {
    
    // MARK: - Properties
    
    private var serverGetUserData: SearchUserResponse?
    
    // MARK: - UI Components
    
    private let emptyView = UIView()
    private let emptyImgView = UIImageView().then {
        $0.image = ImageLiterals.Icn.empty
    }
    private let emptyLabel = UILabel().then {
        $0.font = .h2
        $0.textColor = .peekaRed_60
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.text = I18N.ErrorPopUp.emptyUser
    }
    
    private let headerView = UIView()
    private lazy var backButton = UIButton().then {
        $0.setImage(ImageLiterals.Icn.back, for: .normal)
        $0.addTarget(
            self,
            action: #selector(backBtnTapped),
            for: .touchUpInside
        )
    }
    private let searchTitleLabel = UILabel().then {
        $0.text = I18N.Tabbar.userSearch
        $0.textColor = .peekaRed
        $0.font = .h3
    }
    private let headerUnderlineView = UIView()
    private let searchBarContainerView = UIView()
    private lazy var searchTextField = UITextField().then {
        $0.placeholder = I18N.PlaceHolder.userSearch
        $0.textColor = .peekaRed
        $0.font = .h2
        $0.autocorrectionType = .no
    }
    private lazy var searchBarButton = UIButton().then {
        $0.setImage(ImageLiterals.Icn.search, for: .normal)
        $0.addTarget(
            self,
            action: #selector(searchBtnTapped),
            for: .touchUpInside)
    }
    
    private let friendProfileContainerView = UIView()
    private let profileImage = UIImageView().then {
        $0.image = ImageLiterals.Sample.profile6
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.peekaRed.cgColor
        $0.layer.cornerRadius = 28
        $0.layer.masksToBounds = true
    }
    private let nameLabel = UILabel().then {
        $0.text = "??????"
        $0.textColor = .peekaRed
        $0.font = .h1
    }
    private lazy var followButton = UIButton().then {
        $0.setTitle(I18N.FollowStatus.follow, for: .normal)
        $0.setTitleColor(.peekaWhite, for: .normal)
        $0.titleLabel?.font = .s3
        $0.backgroundColor = .peekaRed
        $0.addTarget(self, action: #selector(followButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func followButtonDidTap() {
        print("?????????")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setBlankView()
    }
    
    @objc private func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func searchBtnTapped() {
        print("??????")
        getUserAPI(nickname: searchTextField.text!)
    }
}

// MARK: - UI & Layout

extension UserSearchVC {
    
    private func setUI() {
        self.view.backgroundColor = .peekaBeige
        headerUnderlineView.backgroundColor = .peekaRed
        emptyView.backgroundColor = .clear
        searchBarContainerView.backgroundColor = .peekaWhite.withAlphaComponent(0.4)
        friendProfileContainerView.backgroundColor = .white
    }
    
    private func setEmptyView() {
        self.friendProfileContainerView.isHidden = true
        self.emptyView.isHidden = false
    }
    
    private func setSuccessView() {
        self.emptyView.isHidden = true
        self.friendProfileContainerView.isHidden = false
    }
    
    private func setBlankView() {
        emptyView.isHidden = true
        friendProfileContainerView.isHidden = true
    }
    
    private func setLayout() {
        view.addSubviews(
            [searchBarContainerView,
            friendProfileContainerView,
            headerView,
            emptyView]
        )
        headerView.addSubviews(
            [backButton,
             searchTitleLabel,
             headerUnderlineView]
        )
        searchBarContainerView.addSubviews(
            [searchTextField,
             searchBarButton]
        )
        emptyView.addSubviews(emptyImgView, emptyLabel)
        friendProfileContainerView.addSubviews(
            [profileImage,
            nameLabel,
            followButton]
        )
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        backButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(48)
        }
        searchTitleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        headerUnderlineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
        
        searchBarContainerView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(48)
        }
        searchBarButton.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
            make.height.width.equalTo(48)
        }
        searchTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalTo(searchBarButton.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
        }
        
        emptyView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchBarContainerView).offset(204)
            make.height.equalTo(96)
            make.width.equalTo(247)
        }
        emptyImgView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyImgView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        
        friendProfileContainerView.snp.makeConstraints { make in
            make.top.equalTo(searchBarContainerView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(176)
        }
        profileImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
            make.height.width.equalTo(56)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }
        followButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(82)
            make.height.equalTo(32)
        }
    }
    
    private func setFollowStatus() {
        followButton.isSelected == true ? followed() : unfollowed()
    }
}

// MARK: - Methods

extension UserSearchVC {
    
    private func followed() {
        followButton.backgroundColor = .peekaGray2
        followButton.setTitle(I18N.FollowStatus.following, for: .normal)
        followButton.isSelected = true
    }
    private func unfollowed() {
        followButton.backgroundColor = .peekaRed
        followButton.setTitle(I18N.FollowStatus.follow, for: .normal)
        followButton.isSelected = false
    }
    
}

// MARK: - Network

extension UserSearchVC {
    private func getUserAPI(nickname: String) {
        FriendAPI.shared.searchUserData(nickname: nickname) { response in
            if response?.success == true {
                guard let serverGetUserData = response?.data else { return }
                self.nameLabel.text = serverGetUserData.nickname
                self.profileImage.image = serverGetUserData.profileImage.makeImage()
                self.followButton.isSelected = serverGetUserData.isFollowed
                self.setFollowStatus()
                self.setSuccessView()
            } else {
                self.setEmptyView()
            }
        }
    }
}
