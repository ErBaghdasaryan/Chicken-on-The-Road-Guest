//
//  HomeService.swift
//  App007ViewModel
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import UIKit
import App007Model

public protocol IHomeService {
    func getMenuItems() -> [MenuPresentationModel]
}

public class HomeService: IHomeService {
    public init() { }

    public func getMenuItems() -> [MenuPresentationModel] {
        [
            MenuPresentationModel(image: "menu1"),
            MenuPresentationModel(image: "menu2"),
            MenuPresentationModel(image: "menu3"),
            MenuPresentationModel(image: "menu4"),
            MenuPresentationModel(image: "menu5"),
            MenuPresentationModel(image: "menu6"),
            MenuPresentationModel(image: "menu7")
        ]
    }

}
