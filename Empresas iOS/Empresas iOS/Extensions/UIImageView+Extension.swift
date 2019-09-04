//
//  UIImage+Extension.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 30/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }

            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        let correctUrl = "http://--/" + link
        guard let url = URL(string: correctUrl) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

