//
//  AboutAssembly.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import App007ViewModel
import Swinject
import SwinjectAutoregistration

final class AboutAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        registerViewModelServices(in: container)
        registerViewModel(in: container)
    }

    func registerViewModel(in container: Container) {
        container.autoregister(IAboutViewModel.self, initializer: AboutViewModel.init)
    }

    func registerViewModelServices(in container: Container) {
        container.autoregister(IAboutService.self, initializer: AboutService.init)
    }
}
