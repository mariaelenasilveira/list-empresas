//
//  EnterpriseType.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

struct EnterpriseType: Codable {
    let id: Int?
    let enterpriseTypeName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case enterpriseTypeName = "enterprise_type_name"
    }
}
