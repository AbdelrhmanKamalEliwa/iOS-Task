//
//  NetworkManager.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

class NetworkManager {
    
    public let session = URLSession(configuration: .default)
    
    func request<T: Codable>(url: URL, httpMethod: httpMethod, parameters: [String : String]?, headers: [String : String]?, completionHandler: @escaping(_ result: APIResult<T>) -> ()) -> URLSessionTask {
        
        // defining the type of method
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        
        // adding parameters to request body
        if parameters != nil {
            do {
                let dataParameters = try JSONSerialization.data(withJSONObject: parameters!)
                urlRequest.httpBody = dataParameters
            } catch let error {
                completionHandler(.badRequest(error))
            }
        }
        
        // adding header value
        if headers != nil {
            for header in headers! {
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        // doing the task
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completionHandler(.failure(error))
                return
            }
            
            if let safeData = data {
                do {
                    // checking of response if it actual string response
                    let stringResponse = String.init(data: safeData, encoding: .utf8)
                    guard let jsonData = stringResponse?.data(using: .utf8) else {
                        completionHandler(.decodingFailure(nil))
                        return
                    }
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    completionHandler(.success(decodedData))
//                    print(decodedData)
                } catch let error {
                    completionHandler(.decodingFailure(error))
                }
            }
        }
        
        task.resume()
        return task
    }
}
