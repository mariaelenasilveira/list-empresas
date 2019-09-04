//
//  ViewController.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        touchScreenHideKeyboard()
        
        loginViewModel.delegate = self
        loginButton.isEnabled = false
        
        emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        loginViewModel.verifyLogin(with: emailTextField.text, and: passwordTextField.text)
        return false
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        loginButton.isEnabled = true
    }

    @IBAction func login(_ sender: Any) {
        loginViewModel.verifyLogin(with: emailTextField.text, and: passwordTextField.text)
    }
}

