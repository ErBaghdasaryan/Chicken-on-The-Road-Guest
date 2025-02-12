//
//  Setupable.swift
//  App007
//
//  Created by Er Baghdasaryan on 12.02.25.
//

import Foundation

protocol ISetupable {
    associatedtype SetupModel
    func setup(with model: SetupModel)
}
