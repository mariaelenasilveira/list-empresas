//
//  LoginViewModel.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class LoginViewModel {
    
    var delegate: UIViewController?
    
    public func verifyLogin(with email: String?, and password: String?) {
        guard let emailString = email, !emailString.isEmpty else {
            delegate?.showAlert(withTitle: "Atenção", andMessage: "É necessário entrar com um email")
            return
        }
        guard let passwordString = password, !passwordString.isEmpty else {
            delegate?.showAlert(withTitle: "Atenção", andMessage: "É necessário entrar com uma senha")
            return
        }
        
        loginRequest(email: emailString, password: passwordString)
    }
    
    private func loginRequest(email: String, password: String){
        
        let request = Request.instance
        let serviceRouteLogin = ServiceRoute.login(email, password)
        
        request.dispatch(request: serviceRouteLogin, tipo: String.self, completionHandler: { (dado, response, error) in
            
            guard let response = response else {
                self.delegate?.showAlert(withTitle: "Falha na conexão", andMessage: "Não foi possível comunicar com o servidor, tente novamente mais tarde.")
                return
            }
            guard let headersResponse = response.allHeaderFields as? [String:String] else { return }

            DispatchQueue.main.async {
                switch response.statusCode {
                case 200:
                    self.saveKeys(header: headersResponse)
                    self.delegate?.dismiss(animated: true, completion: nil)
                case 401:
                    self.delegate?.showAlert(withTitle: "Alerta", andMessage: "Dados incorretos. Tente novament.")
                case 500...599:
                    self.delegate?.showAlert(withTitle: "Alerta", andMessage: "Desculpa o transtorno, pelo visto estamos com um problema em nossos sistemas. Tente novamente mais tarde.")
                default:
                    self.delegate?.showAlert(withTitle: "Alerta", andMessage: "Desculpa o transtorno, houve um erro inesperado.")
                }
            }
        })
    }
    
    private func saveKeys(header: [String:String]){
        UserDefaults.standard.set(header["access-token"], forKey: "access_token")
        UserDefaults.standard.set(header["client"], forKey: "client")
        UserDefaults.standard.set(header["uid"], forKey: "uid")
    }
}
