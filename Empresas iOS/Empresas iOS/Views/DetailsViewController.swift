//
//  DetailsViewController.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var enterpriseNameLabel: UILabel!
    @IBOutlet weak var enterpriseImage: UIImageView!
    @IBOutlet weak var enterpriseDescriptionTextView: UITextView!
    
    var enterprise: Enterprise?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureUI()
    }
    
    private func configureUI() {
        // Por não ter ficado explícito a função do botão, será ocultado por hora.
        searchButton.isHidden = true
    }
    
    private func loadData(){
        guard let enterprise = enterprise else { return }
        if let urlImage = enterprise.photo {
            enterpriseImage.downloaded(from: urlImage, contentMode: .scaleToFill)
        }
        enterpriseNameLabel.text = enterprise.enterpriseName
        enterpriseDescriptionTextView.text = enterprise.description
    }

    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
