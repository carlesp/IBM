//
//  ApiAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public class ApiAssembly {
    public static func makeApiManager(url: String) -> ApiManager {
        return DefaultApiManager(provider: MoyaFactory.getProvider(baseUrlProvider: { url }))
    }
}
