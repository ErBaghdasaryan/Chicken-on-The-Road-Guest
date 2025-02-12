//
//  ServiceAssembly.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import App007ViewModel

public final class ServiceAssembly: Assembly {

    public init() {}

    public func assemble(container: Container) {
        container.autoregister(IKeychainService.self, initializer: KeychainService.init)
        container.autoregister(IAppStorageService.self, initializer: AppStorageService.init)
    }
}
