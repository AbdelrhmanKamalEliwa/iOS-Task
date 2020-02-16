//
//  ViewController.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var hitsData = DataModel()
    @IBOutlet weak var ListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
//        print(hitsData)
    }
    
    
    
    func fetchData() {
        let networkManager = NetworkManager()
        
        let _ = networkManager.request(url: EndPointRouter.getHits, httpMethod: .get, parameters: nil, headers: nil) { (result: APIResult<DataModel>) in
            switch result {
                
            case .success(let data):
                print(data)
//                self.hitsData = data
                break
            case .failure(let error):
                if error != nil {
                    print(error!)
                }
                break
            case .decodingFailure(let error):
                if error != nil {
                    print(error!)
                }
                break
            case .badRequest(let error):
                if error != nil {
                    print(error!)
                }
                break
            }
            
        }
    }
    
    
}

