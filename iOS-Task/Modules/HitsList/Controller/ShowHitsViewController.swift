//
//  ViewController.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class ShowHitsViewController: UIViewController {
    
    var safeIndexPath = 0
    let cellIdentifier = "HitsViewCell"
    var hitsArray = [hits]()
    
    @IBOutlet weak var ListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        ListTableView.delegate = self
        ListTableView.dataSource = self
        fetchData()
    }
    
    
    func registerTableView() {
        ListTableView.register(UINib.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    
    func fetchData() {
        let networkManager = NetworkManager()
        
        let _ = networkManager.request(url: EndPointRouter.getHits, httpMethod: .get, parameters: nil, headers: nil) { (result: APIResult<DataModel>) in
            switch result {
                
            case .success(let data):
                self.hitsArray = data.hits
                DispatchQueue.main.async {
                    self.ListTableView.reloadData()
                }
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goToActivityItemViewController" {
            let hitSafeData = segue.destination as! ActivityItemViewController
            hitSafeData.hitData = self.hitsArray[safeIndexPath]
        }
    }
    
}



//MARK: - Setup TableView
extension ShowHitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HitsViewCell
        
        cell.displayData(hitsName: hitsArray[indexPath.row].user, hitsLikes: hitsArray[indexPath.row].likes, profileImageStringURl: hitsArray[indexPath.row].largeImageURL)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        DispatchQueue.main.async {}
        safeIndexPath = indexPath.row
        self.performSegue(withIdentifier: "goToActivityItemViewController", sender: nil)
    }
    
}


