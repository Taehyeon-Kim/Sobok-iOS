//
//  ShareStateView.swift
//  SobokSobok
//
//  Created by taekki on 2022/08/03.
//

import UIKit

final class ShareStateView: BaseView {
    
    private var isLiked = true {
        didSet {
            updateUI()
        }
    }
    
    private var isEat = true {
        didSet {
            updateUI()
        }
    }
    
    lazy var hStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 4
        $0.addArrangedSubviews(emotionStateBackgroundView, eatStateBackgroundView)
    }
    
    lazy var emotionStateBackgroundView = UIView().then {
        $0.makeRounded(radius: 6)
        $0.addSubview(emotionStateButton)
    }
    
    lazy var emotionStateButton = UIButton()
    lazy var eatStateBackgroundView = UIView().then {
        $0.makeRounded(radius: 6)
        $0.addSubview(eatStateLabel)
    }
    
    lazy var eatStateLabel = UILabel().then {
        $0.font = UIFont.font(.pretendardSemibold, ofSize: 13)
    }
    
    override func setupView() {
        super.setupView()
        
        addSubviews(hStackView)
        updateUI()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        hStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(28.adjustedHeight)
        }
        
        emotionStateBackgroundView.snp.makeConstraints {
            $0.width.height.equalTo(28.adjustedWidth)
        }
        
        emotionStateButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        eatStateLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5.adjustedHeight)
            $0.left.right.equalToSuperview().inset(10.adjustedWidth)
        }
    }
    
    private func updateUI() {
        let emotionStateImage = isLiked ? Image.icEmotionEnd36 : Image.icEmotion36
        let emotionStateBackgroundColor = isLiked ? Color.lightMint : Color.gray150
        let eatStateTitle = isEat ? "먹었어요" : "아직 안 먹었어요"
        let eatStateTitleColor = isEat ? Color.darkMint : Color.gray500
        let eatStateBackgroundColor = isEat ? Color.lightMint : Color.gray150
        
        emotionStateBackgroundView.backgroundColor = emotionStateBackgroundColor
        emotionStateButton.isHidden = !isEat
        emotionStateButton.setImage(emotionStateImage, for: .normal)
        eatStateBackgroundView.backgroundColor = eatStateBackgroundColor
        eatStateLabel.text = eatStateTitle
        eatStateLabel.textColor = eatStateTitleColor
    }
}
