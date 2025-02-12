//
//  HomeViewModel.swift
//  App007ViewModel
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation
import App007Model

public protocol IHomeViewModel {
    var menuItems: [MenuPresentationModel] { get set }
    func loadMenuItems()
}

public class HomeViewModel: IHomeViewModel {

    private let homeService: IHomeService
    public var menuItems: [MenuPresentationModel] = []

    public init(homeService: IHomeService) {
        self.homeService = homeService
    }

    public func loadMenuItems() {
        menuItems = homeService.getMenuItems()
    }
}
