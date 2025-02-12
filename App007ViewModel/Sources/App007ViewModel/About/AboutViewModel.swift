//
//  AboutViewModel.swift
//  App007ViewModel
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import App007Model

public protocol IAboutViewModel {
}

public class AboutViewModel: IAboutViewModel {

    private let aboutService: IAboutService

    public init(aboutService: IAboutService) {
        self.aboutService = aboutService
    }
}
