//
//  Untitled.swift
//  EatsApp
//
//  Created by DaCodes on 06/09/25.
//

import Foundation
class ClientHttp: ClientHttpInputProtocol {
// Regresar las respuestas al manager
var manager: ClientHttpOutputProtocol?
// Variable opcional / se puede usar para comparaciones
var putExtras: String?
// Estado respuesta - se usa para obtener el codigo (opcional)
var httpResponseCode: Int?

internal let decoder = JSONDecoder()
internal let encoder = JSONEncoder()

internal enum httpMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

func get<T:Codable>(url: String, model: T.Type, token: Bool) {
    getResponseInApi(url: url, method: .get, model: model, token: token)
}

func post<T:Codable>(url: String, body: Codable? = nil, model: T.Type, token: Bool) {
    getResponseInApi(url: url, body: body, method: .post, model: model, token: token)
}

func put<T:Codable>(url: String, body: Codable? = nil, model: T.Type, token: Bool) {
    getResponseInApi(url: url, body: body, method: .put, model: model, token: token)
}

func patch<T:Codable>(url: String, body: Codable? = nil, model: T.Type, token: Bool) {
    getResponseInApi(url: url, body: body, method: .patch, model: model, token: token)
}

func delete<T:Codable>(url: String, model: T.Type, token: Bool) {
    getResponseInApi(url: url, method: .delete, model: model, token: token)
}
}

extension ClientHttp {

internal func getResponseInApi<T:Codable>(url: String, body: Codable? = nil, method: httpMethods, model: T.Type, token: Bool) {
    
    // ASignar el bundle
    manager?.bundle = putExtras
    
    // URL para solicitud fallida
    let baseUrl = url
     // Verificar la url
    guard let url = URL(string: url) else {
        let message: String = "La url no es válida"
        manager?.returnResponseWithError(message: message)
        return
    }
    
    // Iniciar las variables
    let session = URLSession.shared
    var request = URLRequest(url: url)
    
    // Asignar el metodo
    request.httpMethod = method.rawValue
    
    // Colocar los encabezados
    request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
    
    if token {
        // ASignar el token
    }
    // Preparar el cuerpo
    if let body = body {
        do {
            request.httpBody = try encoder.encode(body)
        }
        catch {
            let message: String = "El cuerpo no es valido"
            manager?.returnResponseWithError(message: message)
        }
    }
    
    // Realizar la solicitud
    session.dataTask(with: request){ (data, response, error) in
        guard let data = data, error == nil, let response = response as? HTTPURLResponse else {
            let message = "Ocurrio un error en la solicitud"
            self.manager?.returnResponseWithError(message: message)
            return
        }
        self.httpResponseCode = response.statusCode
        
        print("Codigo de respuesta: \(response.statusCode)")
        
        // Validar el codigo de respuesta 200 = Success || 201 = Created
        if response.statusCode == 200 || response.statusCode == 201 {
            self.convertJsonToEntity(from: data, model: model)
            
        }else{
            //
        }

    }.resume()
}
private func convertJsonToEntity<T: Codable>(from data: Data, model: T.Type) {
    do {
        let response = try decoder.decode(model, from: data)
        manager?.returnResponseSucessful(model: response)
    }
    
    catch {
        let message: String = "Ocurrio un error al convertir el json: \(error)"
        manager?.returnResponseWithError(message: message)
    }
}
}
