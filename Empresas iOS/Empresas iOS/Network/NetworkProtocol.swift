//
//  NetworkProtocol.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 30/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
    func dispatch<T: Codable>(request: ServiceRoute, tipo: T.Type, completionHandler: @escaping (T?, HTTPURLResponse?, Error?) -> Void)
}
