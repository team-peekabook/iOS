//
//  EditBookVC.swift
//  Peekabook
//
//  Created by 고두영 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

import Moya

final class EditBookVC: UIViewController {
    
    // MARK: - Properties

    // MARK: - UI Components
    
    private let headerView = UIView()
    
    private lazy var touchBackButton = UIButton().then {
        $0.addTarget(self, action: #selector(touchBackButtonDidTap), for: .touchUpInside)
    }
    
    private let headerTitle = UILabel().then {
        $0.text = I18N.BookEdit.title
        $0.font = .h3
        $0.textColor = .peekaRed
    }
    
    private lazy var touchCheckButton = UIButton().then {
        $0.setTitle(I18N.BookEdit.done, for: .normal)
        $0.titleLabel!.font = .h4
        $0.setTitleColor(.peekaRed, for: .normal)
        $0.addTarget(AddBookVC.self, action: #selector(touchCheckButtonDidTap), for: .touchUpInside)
    }
    
    private let containerView = UIScrollView()
    private let bookImgView = UIImageView()
    
    private var nameLabel = UILabel().then {
        $0.text = "아무튼, 여름"
        $0.font = .h3
        $0.textColor = .peekaRed
    }
    
    private var authorLabel = UILabel().then {
        $0.text = "김신회"
        $0.font = .h2
        $0.textColor = .peekaRed
    }
    
    private let commentBox = UIView()
    private let commentHeader = UIView()
    
    private let commentLabel = UILabel().then {
        $0.text = "한 마디"
        $0.font = .h1
        $0.textColor = .peekaWhite
    }
    
    private let commentView = UITextView().then {
        $0.font = .h2
        $0.textColor = .peekaGray1
        $0.text = I18N.BookDetail.comment
        $0.backgroundColor = .clear
        $0.autocorrectionType = .no
    }
    
    lazy var commentMaxLabel = UILabel().then {
        $0.text = "0/200"
        $0.font = .h2
        $0.textColor = .peekaGray2
    }
    
    private let memoBox = UIView()
    private let memoHeader = UIView()
    
    private let memoLabel = UILabel().then {
        $0.text = "메모"
        $0.font = .h1
        $0.textColor = .peekaWhite
    }
    
    private lazy var memoView = UITextView().then {
        $0.font = .h2
        $0.textColor = .peekaGray1
        $0.text = I18N.BookDetail.memo
        $0.backgroundColor = .clear
        $0.autocorrectionType = .no
    }
    
    lazy var memoMaxLabel = UILabel().then {
        $0.text = "0/50"
        $0.font = .h2
        $0.textColor = .peekaGray2
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        addTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.registerForKeyboardNotification()
        }
    
    deinit {
        self.removeRegisterForKeyboardNotification()
    }
    
}

// MARK: - UI & Layout
extension EditBookVC {
    
    private func setUI() {
        self.view.backgroundColor = .peekaBeige
        headerView.backgroundColor = .clear
        containerView.backgroundColor = .clear
        
        commentBox.backgroundColor = .peekaWhite
        commentBox.layer.borderWidth = 2
        commentBox.layer.borderColor = UIColor.peekaRed.cgColor
        commentHeader.backgroundColor = .peekaRed
        
        memoBox.backgroundColor = .peekaWhite
        memoBox.layer.borderWidth = 2
        memoBox.layer.borderColor = UIColor.peekaRed.cgColor
        memoHeader.backgroundColor = .peekaRed
        
        touchBackButton.setImage(ImageLiterals.Icn.back, for: .normal)
        bookImgView.image = ImageLiterals.Sample.book1
    }
    
    private func setLayout() {
        [containerView, headerView].forEach {
            view.addSubview($0)
        }
        
        [touchBackButton, headerTitle, touchCheckButton].forEach {
            headerView.addSubview($0)
        }
        
        [bookImgView, nameLabel, authorLabel, commentBox, commentMaxLabel, memoBox, memoMaxLabel].forEach {
            containerView.addSubview($0)
        }
        
        [commentHeader, commentView].forEach {
            commentBox.addSubview($0)
        }
        
        [commentLabel].forEach {
            commentHeader.addSubview($0)
        }
        
        [memoHeader, memoView].forEach {
            memoBox.addSubview($0)
        }
        
        [memoLabel].forEach {
            memoHeader.addSubview($0)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        touchBackButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        headerTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        touchCheckButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(11)
            make.width.height.equalTo(48)
        }
        
        bookImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(bookImgView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        commentBox.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(229)
        }
        
        commentHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(36)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
        }
        
        commentView.snp.makeConstraints { make in
            make.top.equalTo(commentHeader.snp.bottom).offset(10)
            make.leading.equalTo(commentLabel)
            make.width.equalTo(307)
            make.height.equalTo(169)
        }
        
        commentMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(commentBox.snp.bottom).offset(8)
            make.trailing.equalTo(commentBox.snp.trailing)
        }
        
        memoBox.snp.makeConstraints { make in
            make.top.equalTo(commentMaxLabel.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(335)
            make.height.equalTo(101)
        }
        
        memoHeader.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(36)
        }
        
        memoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
        }
        
        memoView.snp.makeConstraints { make in
            make.top.equalTo(memoHeader.snp.bottom).offset(10)
            make.leading.equalTo(commentLabel)
            make.width.equalTo(307)
            make.height.equalTo(41)
        }
        
        memoMaxLabel.snp.makeConstraints { make in
            make.top.equalTo(memoBox.snp.bottom).offset(8)
            make.trailing.equalTo(memoBox.snp.trailing)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}

// MARK: - Methods

extension EditBookVC {
    private func setDelegate() {
        commentView.delegate = self
        memoView.delegate = self
    }
    
    // TODO: - 바코드 스캔뷰로 다시 가게 해야함
    // 현재는 홈뷰로 가는 상황
    @objc private func touchBackButtonDidTap() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // TODO: - push 함수 작성 필요
    @objc private func touchCheckButtonDidTap() {
        // doSomething()
    }
    
    private func config() {
        touchBackButton.setImage(ImageLiterals.Icn.back, for: .normal)
        
        bookImgView.image = ImageLiterals.Sample.book1
    }
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyBoardShow),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardHide),
            name: UIResponder.keyboardWillHideNotification, object: nil)
        }

    private func removeRegisterForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self,
            name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,
            name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    // TODO: - 박스에 따른 키보드 처리 필요
    @objc private func keyBoardShow(notification: NSNotification) {
        // 만약 첫번째 뷰에 포커스가 간다면
        self.view.transform = CGAffineTransform(translationX: 0, y: -121)
        // 두번째 뷰에 포커스가 간다면
        // self.view.transform = CGAffineTransform(translationX: 0, y: -270)
    }

    @objc private func keyboardHide(notification: NSNotification) {
        self.view.transform = .identity
    }
}

extension EditBookVC: UITextViewDelegate {
    func textView(
        _ textView: UITextView,
        shouldChangeTextIn range: NSRange,
        replacementText text: String
    ) -> Bool {
        let currentComment = commentView.text ?? ""
        guard let commentRange = Range(range, in: currentComment)
        else { return false }
        let changedComment = currentComment.replacingCharacters(in: commentRange, with: text)
        commentMaxLabel.text = "\(changedComment.count)/200"
        
        let currentMemo = memoView.text ?? ""
        guard let memoRange = Range(range, in: currentMemo)
        else { return false }
        let changedMemo = currentMemo.replacingCharacters(in: memoRange, with: text)
        memoMaxLabel.text = "\(changedMemo.count)/50"
        
        return (changedComment.count < 200) && (changedMemo.count < 50)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == I18N.BookDetail.comment) || (textView.text == I18N.BookDetail.memo) {
            textView.text = nil
            textView.textColor = .peekaRed
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if commentView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            commentView.text = I18N.BookDetail.comment
            commentView.textColor = .peekaGray1
        } else if memoView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            memoView.text = I18N.BookDetail.memo
            memoView.textColor = .peekaGray1
        }
    }
}