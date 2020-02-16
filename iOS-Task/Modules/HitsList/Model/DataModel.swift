//
//  DataModel.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    let hits: [hits]
}

struct hits: Codable {
    let user: String
    let likes: Int
    let largeImageURL: String?
}
