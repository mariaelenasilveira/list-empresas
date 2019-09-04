//
//  API.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

enum ServiceRoute {
    
    case login(String, String)
    case enterprise
    
}

extension ServiceRoute: ServiceRouteProtocol {
    
    var scheme: String {
        return "http"
    }

    var path: String{
        switch self {
        case .login:
            return "-"
        case .enterprise:
            return "-"
        }
    }

    var host: String {
        return "-"
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .enterprise:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return ["Content-Type":"-"]
        case .enterprise:
            guard let accessToken = UserDefaults.standard.string(forKey: "access_token"),
                let uid = UserDefaults.standard.string(forKey: "uid"),
                let client = UserDefaults.standard.string(forKey: "client") else { return nil }
            
            return ["client": client, "uid": uid, "access-token": accessToken, "Content-Type":"-"]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .login(let email, let password):
            return ["email": email, "password": password]
        case .enterprise:
            return nil
        }
    }
    
    
}

