//
//  HitsViewCell.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit
import Kingfisher

class HitsViewCell: UITableViewCell {

    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    
     func displayData(hitsName: String, hitsLikes: Int, profileImageStringURl: String?)
        {
            userNameLabel.text = hitsName
            likesLabel.text = "\(hitsLikes)"
            
            if profileImageStringURl != nil
            {
                guard let url = URL(string: profileImageStringURl!) else { return }
                userImage.kf.indicatorType = .activity
                userImage.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
                    switch result {
                    case .success(let image):
                        self.userImage.image = image.image
                    case .failure(_):
                        self.userImage.image = UIImage(named: "errorImage")?.imageFlippedForRightToLeftLayoutDirection()
                        self.userImage.image = UIImage(named: "UserProfileICON")?.imageFlippedForRightToLeftLayoutDirection()
                        return
                    }
                }
            }
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
