//
//  OnboardingService.swift
//  App007ViewModel
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007Model

public protocol IOnboardingService {
    func getOnboardingItems() -> [OnboardingPresentationModel]
}

public class OnboardingService: IOnboardingService {
    public init() { }

    public func getOnboardingItems() -> [OnboardingPresentationModel] {
        [
            OnboardingPresentationModel(image: "onboarding1",
                                        header: "Next!"),
            OnboardingPresentationModel(image: "onboarding2",
                                        header: "Bon appetit!")
        ]
    }
}
