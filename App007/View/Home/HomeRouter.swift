//
//  HomeRouter.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import UIKit
import App007ViewModel

final class HomeRouter: BaseRouter {
    static func showSettingsViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makeSettingsViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(viewController, animated: true)
    }

    static func showSpendViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makeSpendViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = false
        viewController.modalPresentationStyle = .pageSheet

        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        navigationController.present(viewController, animated: true, completion: nil)
    }

    static func showReceiveViewController(in navigationController: UINavigationController) {
        let viewController = ViewControllerFactory.makeReceiveViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = false
        viewController.modalPresentationStyle = .pageSheet

        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        navigationController.present(viewController, animated: true)
    }
}
