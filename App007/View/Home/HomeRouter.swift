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
        guard let homeVC = navigationController.viewControllers.first(where: { $0 is HomeViewController }) as? HomeViewController else { return }

        let viewController = ViewControllerFactory.makeSpendViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = false
        viewController.modalPresentationStyle = .pageSheet

        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        UIView.animate(withDuration: 0.3) {
            homeVC.dimmingView.alpha = 1
        }

        navigationController.present(viewController, animated: true) {
            viewController.dismissCompletion = {
                UIView.animate(withDuration: 0.3) {
                    homeVC.dimmingView.alpha = 0
                }
            }
        }
    }

    static func showReceiveViewController(in navigationController: UINavigationController) {
        guard let homeVC = navigationController.viewControllers.first(where: { $0 is HomeViewController }) as? HomeViewController else { return }

        let viewController = ViewControllerFactory.makeReceiveViewController()
        viewController.navigationItem.hidesBackButton = true
        navigationController.navigationBar.isHidden = false
        viewController.modalPresentationStyle = .pageSheet

        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }

        UIView.animate(withDuration: 0.3) {
            homeVC.dimmingView.alpha = 1
        }

        navigationController.present(viewController, animated: true) {
            viewController.dismissCompletion = {
                UIView.animate(withDuration: 0.3) {
                    homeVC.dimmingView.alpha = 0
                }
            }
        }
    }
}
