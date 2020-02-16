//
//  EndPointRouter.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct EndPointRouter {
    static var getHits: URL { return URL(string: APIService.baseURL() + "/api/?key=11778875-bd18dbcb72c8cc6ad02f06b46&q=animal+love&image_type=photo")! }
}
