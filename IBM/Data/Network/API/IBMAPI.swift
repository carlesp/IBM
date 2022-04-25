//
//  IBMAPI.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Moya

enum IBMAPI {
    case getRates
    case getTransactions
}

extension IBMAPI: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL {
        return URL(string: "https://not.in.use/")!
    }
    
    var path: String {
        switch self {
        case .getRates:
            return "rates"
        case .getTransactions:
            return "transactions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRates,
             .getTransactions:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRates,
             .getTransactions:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .getRates,
                 .getTransactions:
            return ["Content-Type": "application/json"]
        }
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
            case .getRates,
                 .getTransactions:
            return .bearer
        }
    }
    
}
