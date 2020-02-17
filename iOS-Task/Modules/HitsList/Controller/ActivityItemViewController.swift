//
//  ActivityItemViewController.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/17/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import UIKit

class ActivityItemViewController: UIViewController {

    @IBOutlet weak var hitsUserName: UILabel!
    @IBOutlet weak var hitsLikes: UILabel!
    @IBOutlet weak var hitsImageView: UIImageView!
    
    var hitData: hits?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hitsImageView.image = UIImage(named: "deafultHitImage") 

        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUIActivityItemViewController() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
