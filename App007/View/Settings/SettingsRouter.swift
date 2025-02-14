//
//  SettingsRouter.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import UIKit
import App007ViewModel

final class SettingsRouter: BaseRouter {
    static func showAboutViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makeAboutViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }

    static func showPrivacyViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makePrivacyViewController()
        viewController.navigationItem.hidesBackButton = false
        navigationController.navigationBar.isHidden = false
        viewController.hidesBottomBarWhenPushed = true
        navigationController.navigationBar.backgroundColor = .white
        navigationController.pushViewController(viewController, animated: true)
    }

    static func showTermsViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makeTermsViewController()
        viewController.navigationItem.hidesBackButton = false
        navigationController.navigationBar.isHidden = false
        viewController.hidesBottomBarWhenPushed = true
        navigationController.navigationBar.backgroundColor = .white
        navigationController.pushViewController(viewController, animated: true)
    }
}
