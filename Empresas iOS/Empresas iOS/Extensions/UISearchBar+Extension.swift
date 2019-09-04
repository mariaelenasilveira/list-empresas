//
//  UISearchBar.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 31/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

extension UISearchBar {
    func changeClearButtonColor(color: UIColor){
        if let searchTextField = self.value(forKey: "_searchField") as? UITextField , let clearButton = searchTextField.value(forKey: "_clearButton") as? UIButton {
            guard let imagem = UIImage(named: "iconClearButton") else { return }
            
            clearButton.setImage(imagem, for: .highlighted)
            clearButton.setImage(imagem, for: .normal)
        }
    }
}
