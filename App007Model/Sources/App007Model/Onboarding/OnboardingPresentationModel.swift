//
//  OnboardingPresentationModel.swift
//  App007Model
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation

public struct OnboardingPresentationModel {
    public let image: String
    public let header: String

    public init(image: String, header: String) {
        self.image = image
        self.header = header
    }
}
