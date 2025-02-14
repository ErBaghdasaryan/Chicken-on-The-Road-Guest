//
//  PrivacyViewController.swift
//  App007
//
//  Created by Er Baghdasaryan on 14.02.25.
//

import UIKit
import WebKit
import SnapKit

final class PrivacyViewController: BaseViewController {

    private let webView = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        view.backgroundColor = .white
        self.title = "Privacy Policy"
        self.navigationController?.navigationBar.tintColor = .black
        self.webView.backgroundColor = .clear
        if let url = URL(string: "https://www.termsfeed.com/live/406caef7-b33e-4f69-8a93-23f79af425f9") {
            webView.load(URLRequest(url: url))
        }

        setupConstraints()
    }

    private func setupConstraints() {
        self.view.addSubview(webView)

        webView.snp.makeConstraints { view in
            view.top.equalToSuperview()
            view.bottom.equalToSuperview()
            view.leading.equalToSuperview()
            view.trailing.equalToSuperview()
        }
    }

    override func setupViewModel() {

    }

}

import SwiftUI

struct PrivacyViewControllerProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {
        let privacyViewController = PrivacyViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<PrivacyViewControllerProvider.ContainerView>) -> PrivacyViewController {
            return privacyViewController
        }

        func updateUIViewController(_ uiViewController: PrivacyViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<PrivacyViewControllerProvider.ContainerView>) {
        }
    }
}
