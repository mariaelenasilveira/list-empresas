//
//  NavigationController.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidAppear(_ animated: Bool) {
        verifyLogin()
    }
    
    private func verifyLogin() {
        let token = UserDefaults.standard.string(forKey: "access_token")
        if token == nil {
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            self.present(loginViewController, animated: true, completion: nil)
        }
    }
}
