//
//  AppAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 21/4/22.
//

import UIKit
import Swinject

class AppAssembly: Assembly {
    func assemble(container: Container) {
        // UIWindow
        container.register(UIWindow.self) { _ in
            UIWindow(frame: UIScreen.main.bounds)
            }.inObjectScope(.container)
    }
}
