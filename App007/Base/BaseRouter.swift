//
//  BaseRouter.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import Combine
import App007ViewModel

class BaseRouter {

    class func popViewController(in navigationController: UINavigationController, completion: (() -> Void)? = nil) {
        completion?()
        navigationController.popViewController(animated: true)
    }
}
