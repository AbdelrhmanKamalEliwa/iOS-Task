//
//  ActivityItemViewController.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/17/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class ActivityItemViewController: UIViewController {

    @IBOutlet private weak var hitsUserNameLabel: UILabel!
    @IBOutlet private weak var hitsLikesLabel: UILabel!
    @IBOutlet private weak var hitsImageView: UIImageView!
    
    var hitData: hits?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIActivityItemViewController()
    }
    
    
    func updateUIActivityItemViewController() {
        if hitData != nil {
            displayData(hitsName: hitData!.user, hitsLikes: hitData!.likes, profileImageStringURl: hitData?.largeImageURL)
        } else {
            displayDeafultData()
        }
    }
    
    
   func displayData(hitsName: String, hitsLikes: Int, profileImageStringURl: String?)
    {
        hitsUserNameLabel.text = hitsName
        hitsLikesLabel.text = "\(hitsLikes)"
        
        if profileImageStringURl != nil
        {
            guard let url = URL(string: profileImageStringURl!) else { return }
            hitsImageView.kf.indicatorType = .activity
            hitsImageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                switch result {
                case .success(let image):
                    self.hitsImageView.image = image.image
                case .failure(_):
                    self.hitsImageView.image = UIImage(named: "deafultHitImage")?.imageFlippedForRightToLeftLayoutDirection()
                    return
                }
            }
        }
    }
    
    
    func displayDeafultData() {
        hitsUserNameLabel.text = "Deafult User Name"
        hitsLikesLabel.text = "12345"
        hitsImageView.image = UIImage(named: "deafultHitImage")
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
