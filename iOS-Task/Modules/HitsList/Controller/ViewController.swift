//
//  ViewController.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    
}



//MARK: - Setup TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hitsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HitsViewCell

        cell.userNameLabel.text = hitsArray[indexPath.row].user
        cell.likesLabel.text = "\(hitsArray[indexPath.row].likes)"
        cell.userImage.kf.indicatorType = .activity
        let dummyImage = UIImageView()
        if let imgStringUrl = hitsArray[indexPath.row].largeImageURL, let imgUrl = URL(string: imgStringUrl) {
            dummyImage.kf.setImage(with: imgUrl, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                switch result {

                case .success(let img):
                    cell.userImage.image = img.image
                case .failure(_):
                    cell.userImage.image = UIImage(named: "errorImage")
                }
            }
        }

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}


