//
//  EnterpriseMaior.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

struct ContentEnterprise: Codable {
    let enterprises: [Enterprise]
    
    enum CodingKeys: String, CodingKey {
        case enterprises
    }
}
