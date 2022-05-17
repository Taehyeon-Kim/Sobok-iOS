//
//  FriendNameView.swift
//  SobokSobok
//
//  Created by taehy.k on 2022/05/18.
//

import UIKit

final class FriendNameView: BaseView {
    
    lazy var friendNameLabel = UILabel().then {
        $0.font = UIFont.font(.pretendardBold, ofSize: 24)
    }
    
    lazy var friendNameEditButton = UIButton().then {
        $0.setImage(Image.icPencil32, for: .normal)
        $0.tintColor = Color.gray400
    }
    
    override func setupView() {
        addSubviews(friendNameLabel, friendNameEditButton)
    }
    
    override func setupConstraints() {
        friendNameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        friendNameEditButton.snp.makeConstraints {
            $0.leading.equalTo(friendNameLabel.snp.trailing)
            $0.bottom.equalTo(friendNameLabel.snp.bottom)
        }
    }
}
