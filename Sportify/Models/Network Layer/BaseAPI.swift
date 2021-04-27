//
//  BaseAPI.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/27/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T:TargetType> {
    
    func fetchData<M:Decodable>(target:T,responseClass : M.Type,completion: @escaping (Result<M?,NSError>) -> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        print(target.baseURL+target.path)
        AF.request(target.baseURL + target.path, method: method , parameters: params.0,encoding: params.1, headers: headers)
            .responseJSON { (response) in
                guard let statusCode = response.response?.statusCode else {
                    //add custom Error
                    completion(.failure(NSError()))
                    return
                }
                if statusCode == 200 {
                    //successful request
                    guard let jsonResponse = try? response.result.get() else {
                        //add custom Error
                        completion(.failure(NSError()))
                        return
                    }
                    guard let theJsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                        //add custom Error
                        completion(.failure(NSError()))
                        return
                    }
                    guard let responseObject = try? JSONDecoder().decode(M.self, from: theJsonData) else {
                        //add custom Error
                        completion(.failure(NSError()))
                        return
                    }
                    
                    completion(.success(responseObject))
                }else{
                    //add error depending on statusCode
                    completion(.failure(NSError()))
                }
        }
    }
    
    private func buildParams(task:Task)-> ([String:Any],ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:],URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters,encoding)
        }
    }
}
