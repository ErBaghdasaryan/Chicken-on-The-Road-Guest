//
//  AboutViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007ViewModel
import SnapKit

class AboutViewController: BaseViewController {

    var viewModel: ViewModel?

    private let header = UILabel(text: "About the Loyality",
                                 textColor: UIColor(hex: "#FFC21A")!,
                                 font: UIFont(name: "SFProText-Bold", size: 24))
    private let text = TextView(placeholder: "")
    private let backButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonsAction()
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

        self.text.isUserInteractionEnabled = false
        self.text.textAlignment = .center
        self.text.text = """
        
        Chicken on The Road Guest – Exclusive Loyalty Program!


        Our loyalty system allows you to earn and redeem points for visits, purchases, and special promotions. The more you engage, the more rewards you unlock!


        Scan the QR code during your visit to collect bonus points.
        Use your points to redeem special offers and discounts.
        Track your balance and loyalty level in the app.


        More points – more rewards! Join now and start earning today!
        """

        self.view.addSubview(header)
        self.view.addSubview(text)
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

        text.snp.makeConstraints { view in
            view.top.equalTo(header.snp.bottom).offset(28)
            view.leading.equalToSuperview().offset(16)
            view.trailing.equalToSuperview().inset(16)
            view.bottom.equalToSuperview().inset(196)
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
extension AboutViewController {
    
    private func makeButtonsAction() {
        self.backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
    }

    @objc func backTapped() {
        guard let navigationController = self.navigationController else { return }
        SettingsRouter.popViewController(in: navigationController)
    }
}

extension AboutViewController: IViewModelableController {
    typealias ViewModel = IAboutViewModel
}


//MARK: Preview
import SwiftUI

struct AboutViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let aboutViewController = AboutViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<AboutViewControllerProvider.ContainerView>) -> AboutViewController {
            return aboutViewController
        }

        func updateUIViewController(_ uiViewController: AboutViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AboutViewControllerProvider.ContainerView>) {
        }
    }
}
