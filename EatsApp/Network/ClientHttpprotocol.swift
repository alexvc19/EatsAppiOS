//
//  ClientHttpprotocol.swift
//  EatsApp
//
//  Created by DaCodes on 06/09/25.
//

import Foundation

protocol ClientHttpInputProtocol: AnyObject {
    var manager: ClientHttpOutputProtocol? { get set }
    var putExtras: String? { get set }
    var httpResponseCode: Int? { get set }
    
    func get<T: Codable>(url: String, model: T.Type, token: Bool)
    func post<T: Codable>(url: String, body: Codable?, model: T.Type, token: Bool)
    func put<T: Codable>(url: String, body: Codable?, model: T.Type, token: Bool)
    func patch<T: Codable>(url: String, body: Codable?, model: T.Type, token: Bool)
    func delete<T: Codable>(url: String, model: T.Type, token: Bool)
}

protocol ClientHttpOutputProtocol: AnyObject {
    var httpClient: ClientHttpInputProtocol? { get set }
    var bundle: String? { get set }
    
    func returnResponseSucessful(model: Codable)
    func returnResponseWithError(message: String)
}
