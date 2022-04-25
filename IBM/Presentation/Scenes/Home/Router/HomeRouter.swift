//
//  HomeRouter.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Swinject

protocol HomeRouter {
    func goDetailProduct(product: Product, rates: [Rate])
}

class DefaultHomeRouter: HomeRouter {

    private let hostViewControllerProvider: Provider<HomeViewController>
    private let detailViewControllerProvider: Provider<ProductDetailViewController>
    
    init(hostViewControllerProvider: Provider<HomeViewController>,
         detailViewControllerProvider: Provider<ProductDetailViewController>) {
        self.hostViewControllerProvider = hostViewControllerProvider
        self.detailViewControllerProvider = detailViewControllerProvider
    }
    
    func goDetailProduct(product: Product, rates: [Rate]) {
        let mainController = hostViewControllerProvider.instance
        let detailController = detailViewControllerProvider.instance
        
        detailController.product = product
        detailController.rates = rates

        mainController.navigationController?.pushViewController(detailController, animated: true)
    }
}
