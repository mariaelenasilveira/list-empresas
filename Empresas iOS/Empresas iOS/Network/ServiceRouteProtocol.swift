//
//  ServiceRouteProtocol.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 30/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

protocol ServiceRouteProtocol {
    
    var scheme: String { get  }
    var host: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String:String]? { get }
    var body: [String: String]? { get }

}
