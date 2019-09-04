//
//  EnterpriseTableViewCell.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class EnterpriseTableViewCell: UITableViewCell {

    @IBOutlet weak var enterpriseImage: UIImageView!
    @IBOutlet weak var enterpriseNameLabel: UILabel!
    @IBOutlet weak var enterpriseTypeNameLabel: UILabel!
    @IBOutlet weak var enterpriseCountryLabel: UILabel!
    
    var enterprise: Enterprise? {
        didSet {
            configure()
        }
    }
    
    private func configure(){
        
        guard let enterprise = enterprise else { return }
        DispatchQueue.main.async {
            self.enterpriseTypeNameLabel.text = enterprise.enterpriseType?.enterpriseTypeName
            self.enterpriseNameLabel.text = enterprise.enterpriseName
            
            if let imageUrlString = enterprise.photo {
                self.enterpriseImage.downloaded(from: imageUrlString, contentMode: .scaleToFill)
            }
        }
    }
}
