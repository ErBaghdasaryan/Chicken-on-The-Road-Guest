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
}
