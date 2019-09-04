//
//  File.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

struct Enterprise: Codable {
    let id: Int?
    let emailEnterprise: String?
    let facebook: String?
    let twitter: String?
    let linkedin: String?
    let phone: String?
    let ownEnterprise: Bool?
    let enterpriseName: String
    let photo: String?
    let description: String?
    let city: String?
    let country: String?
    let value: Int?
    let sharePrice: Float?
    let enterpriseType: EnterpriseType?
    
    enum CodingKeys: String, CodingKey {
        case id, facebook, twitter, linkedin, phone, photo, description, city, country, value
        case emailEnterprise = "email_enterprise"
        case ownEnterprise = "own_enterprise"
        case enterpriseName = "enterprise_name"
        case sharePrice = "share_price"
        case enterpriseType = "enterprise_type"
    }
}

