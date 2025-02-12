//
//  SettingsButton.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit

class SettingsButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        self.backgroundColor = UIColor(hex: "#161824")
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 17)
        self.contentHorizontalAlignment = .left
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true

        let arrowImage = UIImageView(image: UIImage(systemName: "chevron.right"))
        arrowImage.tintColor = .white
        self.addSubview(arrowImage)

        arrowImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(9)
            make.height.equalTo(16.5)
        }
    }
}
