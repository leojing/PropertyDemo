//
//  PropertyDetailViewController.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var suburbLabel: UILabel!
    
    var property: PropertyDisplayModel? {
        didSet {
            setupUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func setupUI() {        
        if let profileImage = property?.profileImage {
            DispatchQueue.global().async {
                self.profileImageView.kf.setImage(with: URL(string: profileImage), placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, type, url) in
                    guard let image = image else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.profileImageView.resizeImage(image: image, newWidth: 800)
                    }
                }
            }
        }
        
        titleLabel.text = property?.title
        addressLabel.text = property?.address
        suburbLabel.text = property?.suburb
    }

}

