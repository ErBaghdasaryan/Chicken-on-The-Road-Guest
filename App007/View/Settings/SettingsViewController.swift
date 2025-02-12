//
//  SettingsViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007ViewModel
import SnapKit

class SettingsViewController: BaseViewController {

    var viewModel: ViewModel?

    private let header = UILabel(text: "Settings",
                                 textColor: UIColor(hex: "#FFC21A")!,
                                 font: UIFont(name: "SFProText-Bold", size: 24))
    private let descriptionn = SettingsButton()
    private let privacy = SettingsButton()
    private let terms = SettingsButton()
    private let backButton = UIButton(type: .system)
    private let pushNtf = UILabel(text: "Push Notifications",
                                  textColor: .white,
                                  font: UIFont(name: "SFProText-Bold", size: 17))
    private let stayUpdate = UILabel(text: "Stay updated & control your experience!",
                                     textColor: .white.withAlphaComponent(0.7),
                                     font: UIFont(name: "SFProText-Regular", size: 15))
    private let ntfSwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonsAction()
    }

    override func setupUI() {
        super.setupUI()

        self.view.backgroundColor = UIColor(hex: "#161824")

        self.header.textAlignment = .left
        self.pushNtf.textAlignment = .left
        self.stayUpdate.textAlignment = .left

        self.backButton.setTitle("Back", for: .normal)
        self.backButton.setTitleColor(.black, for: .normal)
        self.backButton.titleLabel?.font = UIFont(name: "Knewave-Regular", size: 24)
        self.backButton.backgroundColor = UIColor(hex: "#FFC21A")
        self.backButton.layer.masksToBounds = true
        self.backButton.layer.cornerRadius = 30

        self.descriptionn.setTitle("Loyalty Program Description", for: .normal)
        self.privacy.setTitle("Privacy Policy", for: .normal)
        self.terms.setTitle("Terms", for: .normal)

        self.ntfSwitch.isOn = true
        ntfSwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)

        self.view.addSubview(header)
        self.view.addSubview(descriptionn)
        self.view.addSubview(privacy)
        self.view.addSubview(terms)
        self.view.addSubview(pushNtf)
        self.view.addSubview(stayUpdate)
        self.view.addSubview(ntfSwitch)
        self.view.addSubview(backButton)
        setupConstraints()
    }

    override func setupViewModel() {
        super.setupViewModel()
    }

    func setupConstraints() {
        header.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(69)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(41)
        }

        descriptionn.snp.makeConstraints { view in
            view.top.equalTo(header.snp.bottom).offset(28)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(24)
        }

        privacy.snp.makeConstraints { view in
            view.top.equalTo(descriptionn.snp.bottom).offset(28)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(24)
        }

        terms.snp.makeConstraints { view in
            view.top.equalTo(privacy.snp.bottom).offset(28)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(24)
        }

        pushNtf.snp.makeConstraints { view in
            view.top.equalTo(terms.snp.bottom).offset(28)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(24)
        }

        stayUpdate.snp.makeConstraints { view in
            view.top.equalTo(pushNtf.snp.bottom).offset(7)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(24)
        }

        ntfSwitch.snp.makeConstraints { view in
            view.centerY.equalTo(pushNtf.snp.centerY)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(31)
            view.width.equalTo(51)
        }

        backButton.snp.makeConstraints { view in
            view.bottom.equalToSuperview().inset(60)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.height.equalTo(108)
        }
    }

}

//MARK: Make buttons actions
extension SettingsViewController {
    
    private func makeButtonsAction() {
        self.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        self.descriptionn.addTarget(self, action: #selector(descriptionTapped), for: .touchUpInside)
        self.privacy.addTarget(self, action: #selector(privacyTapped), for: .touchUpInside)
        self.terms.addTarget(self, action: #selector(termsTapped), for: .touchUpInside)
    }

    @objc func backTapped() {
        guard let navigationController = self.navigationController else { return }
        navigationController.popViewController(animated: true)
    }

    @objc func descriptionTapped() {
        guard let navigationController = self.navigationController else { return }
        SettingsRouter.showAboutViewController(in: navigationController)
    }

    @objc func termsTapped() {
        
    }

    @objc func privacyTapped() {
        
    }

    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is ON")
        } else {
            print("Switch is OFF")
        }
    }
}

extension SettingsViewController: IViewModelableController {
    typealias ViewModel = ISettingsViewModel
}


//MARK: Preview
import SwiftUI

struct SettingsViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let settingsViewController = SettingsViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<SettingsViewControllerProvider.ContainerView>) -> SettingsViewController {
            return settingsViewController
        }

        func updateUIViewController(_ uiViewController: SettingsViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SettingsViewControllerProvider.ContainerView>) {
        }
    }
}
