//
//  APIResult.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case success(T)
    case failure(Error?)
    case decodingFailure(Error?)
    case badRequest(Error?)
}
