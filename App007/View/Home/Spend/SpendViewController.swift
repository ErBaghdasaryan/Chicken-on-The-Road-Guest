//
//  SpendViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007ViewModel
import SnapKit

class SpendViewController: UIViewController {

    private let qrImage = UIImageView(image: UIImage(named: "spend"))
    private let spend = UILabel(text: "Spend",
                                textColor: .white,
                                font: UIFont(name: "Knewave-Regular", size: 24))
    private let c = UILabel(text: "C",
                            textColor: UIColor(hex: "#FFC21A")!,
                            font: UIFont(name: "Knewave-Regular", size: 24))
    private var labelStack: UIStackView!

    var dismissCompletion: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissCompletion?()
    }

    private func setupUI() {

        self.view.backgroundColor = UIColor(hex: "#161824")

        self.labelStack = UIStackView(arrangedSubviews: [spend, c],
                                      axis: .horizontal,
                                      spacing: -20)

        self.view.addSubview(qrImage)
        self.view.addSubview(labelStack)
        setupConstraints()
    }

    private func setupConstraints() {
        qrImage.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(42)
            view.leading.equalToSuperview().offset(28)
            view.trailing.equalToSuperview().inset(28)
            view.height.equalTo(319)
        }

        labelStack.snp.makeConstraints { view in
            view.top.equalTo(qrImage.snp.bottom).offset(31)
            view.centerX.equalToSuperview()
            view.height.equalTo(30)
            view.width.equalTo(121)
        }
    }

    // MARK: - Deinit
    deinit {
        #if DEBUG
        print("deinit \(String(describing: self))")
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("NewMessage"), object: nil)
        #endif
    }
}

//MARK: Preview
import SwiftUI

struct SpendViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let spendViewController = SpendViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SpendViewControllerProvider.ContainerView>) -> SpendViewController {
            return spendViewController
        }

        func updateUIViewController(_ uiViewController: SpendViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SpendViewControllerProvider.ContainerView>) {
        }
    }
}
