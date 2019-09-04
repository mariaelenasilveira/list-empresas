//
//  request.swift
//  Empresas iOS
//
//  Created by Mariaelena Silveira on 28/08/19.
//  Copyright © 2019 Mariaelena Nascimento Silveira. All rights reserved.
//

import Foundation

public struct Request: NetworkProtocol {
    
    public static let instance = Request()
    private init() {}
    
    func dispatch<T: Codable>(request: ServiceRoute, tipo: T.Type, completionHandler: @escaping (T?, HTTPURLResponse?, Error?) -> Void) {
        var components = URLComponents()
        components.scheme = request.scheme
        components.host = request.host
        components.path = request.path
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        if let headers = request.headers {
            urlRequest.allHTTPHeaderFields = headers
        }
        
        if request.body != nil {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.body as Any, options: .prettyPrinted)
            } catch {
                fatalError("Error encoding body")
            }
        }
        
        URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            
            if let error = error as NSError?,
                error.domain == NSURLErrorDomain,
                error.code == NSURLErrorNotConnectedToInternet {
                completionHandler(nil, nil, nil)
            }
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler(nil, nil, error)
                return
            }
            
            if response.statusCode >= 200, response.statusCode <= 299 {
                guard let novaData = data else { return }
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .millisecondsSince1970
                    
                    let dadoDecodificado = try decoder.decode(tipo.self, from: novaData)
                    completionHandler(dadoDecodificado, response, nil)
                    
                } catch let error{
                    print(error)
                    completionHandler(nil, response, error)
                }
            } else {
                completionHandler(nil, response, error)
            }
        }.resume()
    }
}
