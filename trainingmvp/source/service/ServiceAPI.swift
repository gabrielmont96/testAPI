//
//  ServiceAPI.swift
//  cea
//
//  Created by Wagner Rodrigues on 23/05/17.
//  Copyright © 2017 pontomobile. All rights reserved.
//
//swiftlint:disable all

import ObjectMapper
import Alamofire


public struct Response<T> {
    var data: T?
    let result: Result
}

public enum Result {
    case success
    case error(message: String)
}



// swiftlint:disable file_length
// swiftlint:disable type_body_length
final class ServiceAPI {
    
    
    //MARK: - LOGS
    func log(_ str: Any...){
        print("===> CEADB ServiceAPI: \(str[0])"); if str.count > 1 { print(str[1]) }
    }
    
    
    static let shared: ServiceAPI = ServiceAPI()
    
    private init() {}
    
    ///TODO: Teste de Error não fatal em requisições
    func getTest(callback: @escaping (DataResponse<Any>) -> Void) {
        let url = URL(string: "https://demo6575399.mockable.io/rickandmorty")!
        Network.request(url, method: .get, completion: callback)
    }
    
}
