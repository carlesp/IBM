//
//  AppDelegate.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 21/4/22.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let assembler = Assembler([
        // UI
        AppAssembly(),
        HomeAssembly(),
        ProductAssembly(),
        
        // Domain
        UseCaseAssembly(),
        
        // Data
        RepositoryAssembly(),
    ])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpUIWindow()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    private func setUpUIWindow() {
        window = assembler.resolver.resolve(UIWindow.self)
        let navigationController = UINavigationController(rootViewController: assembler.resolver.resolve(HomeViewController.self)!)
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

