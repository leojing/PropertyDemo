//
//  PropertyListTableviewCell.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 20/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import UIKit
import Kingfisher

class PropertyListTableviewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var suburbLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var bathLabel: UILabel!
    @IBOutlet weak var carpotLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImageView.roundedRectImageViewWithCornerRadius(avatarImageView.frame.width/2)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func reuseId() -> String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        profileImageView.kf.setImage(with: nil)
        avatarImageView.kf.setImage(with: nil)
    }
    
    func configureCell(_ property: PropertyDisplayModel?) {
        guard let property = property else {
            return
        }
        
        if let profileImage = property.profileImage {
            DispatchQueue.global().async {
                self.profileImageView.kf.setImage(with: URL(string: profileImage), placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, type, url) in
                    guard let image = image else {
                        self.profileImageView.image = nil
                        return
                    }
                    DispatchQueue.main.async {
                        self.profileImageView.resizeImage(image: image, newWidth: 800)
                    }
                }
            }
        }
        
        if let avatarImage = property.avatarImage {
            DispatchQueue.global().async {
                self.avatarImageView.kf.setImage(with: URL(string: avatarImage), placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: nil) { (image, error, type, url) in
                    guard let image = image else {
                        self.avatarImageView.image = nil
                        return
                    }
                    DispatchQueue.main.async {
                        self.avatarImageView.resizeImage(image: image, newWidth: 200)
                    }
                }
            }
        }
        
        titleLabel.text = property.title
        
        addressLabel.text = property.address
        
        suburbLabel.text = property.suburb
        
        ownerLabel.text = property.owner
        
        bedLabel.text = property.bed
        
        bathLabel.text = property.bath
        
        carpotLabel.text = property.carpot
    }

}
