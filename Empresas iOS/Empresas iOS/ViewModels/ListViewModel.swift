//
//  ListTableViewModel.swift
//  Empresas iOS
//
//  Created by Mariaelena Nascimento Silveira on 29/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import UIKit

class ListViewModel {
    
    var delegate: UIViewController?
    
    var arrayEnterprise: [Enterprise] = []
    
    public func loadEnterprises(){
        guard let delegate = delegate as? ListTableViewController else { return }
        if delegate.arrayEnterprise.isEmpty {
            requestEnterprise()
        }
    }
    
    private func requestEnterprise(){
        let serviceRouteEnterprise = ServiceRoute.enterprise
        let request = Request.instance
        request.dispatch(request: serviceRouteEnterprise, tipo: ContentEnterprise.self, completionHandler: { (data, response, error) in
            
            guard let response = response else {
                self.delegate?.showAlert(withTitle: "Falha na conexão", andMessage: "Não foi possível comunicar com o servidor, tente novamente mais tarde.")
                return
            }
            
            DispatchQueue.main.async {
                switch response.statusCode {
                case 200:
                    DispatchQueue.main.async {
                        guard let data = data else { return }
                        self.saveEnterprises(enterprises: data.enterprises)
                    }
                default:
                    self.delegate?.showAlert(withTitle: "Alerta", andMessage: "Desculpa o transtorno, houve um erro inesperado.")
                }
            }
        })
    }
    
    private func saveEnterprises(enterprises: [Enterprise]) {
        arrayEnterprise = enterprises
    }
}

