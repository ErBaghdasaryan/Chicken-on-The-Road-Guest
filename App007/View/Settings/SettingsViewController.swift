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

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonsAction()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.backgroundColor = UIColor(hex: "#161824")
    }

    override func setupUI() {
        super.setupUI()

        self.view.backgroundColor = UIColor(hex: "#161824")

        self.header.textAlignment = .left

        self.backButton.setTitle("Back", for: .normal)
        self.backButton.setTitleColor(.black, for: .normal)
        self.backButton.titleLabel?.font = UIFont(name: "Knewave-Regular", size: 24)
        self.backButton.backgroundColor = UIColor(hex: "#FFC21A")
        self.backButton.layer.masksToBounds = true
        self.backButton.layer.cornerRadius = 30

        self.descriptionn.setTitle("Loyalty Program Description", for: .normal)
        self.privacy.setTitle("Privacy Policy", for: .normal)
        self.terms.setTitle("Terms", for: .normal)

        self.view.addSubview(header)
        self.view.addSubview(descriptionn)
        self.view.addSubview(privacy)
        self.view.addSubview(terms)
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
        HomeRouter.popViewController(in: navigationController) {
            navigationController.navigationBar.isHidden = false
        }
    }

    @objc func descriptionTapped() {
        guard let navigationController = self.navigationController else { return }
        SettingsRouter.showAboutViewController(in: navigationController)
    }

    @objc func termsTapped() {
        guard let navigationController = self.navigationController else { return }
        SettingsRouter.showTermsViewController(in: navigationController)
    }

    @objc func privacyTapped() {
        guard let navigationController = self.navigationController else { return }
        SettingsRouter.showPrivacyViewController(in: navigationController)
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
