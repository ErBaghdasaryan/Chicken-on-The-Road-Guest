//
//  SettingsViewModel.swift
//  App007ViewModel
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import App007Model

public protocol ISettingsViewModel {
}

public class SettingsViewModel: ISettingsViewModel {

    private let settingsService: ISettingsService

    public init(settingsService: ISettingsService) {
        self.settingsService = settingsService
    }
}
