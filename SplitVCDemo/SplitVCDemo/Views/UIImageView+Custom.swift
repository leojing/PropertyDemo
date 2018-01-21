//
//  UIView+Round.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 21/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func roundedRectImageViewWithCornerRadius( _ cornerRadius: CGFloat) {
        let bezierPath: UIBezierPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius)
        let layer = CAShapeLayer()
        layer.path = bezierPath.cgPath
        self.layer.mask = layer;
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.image = newImage
    }

}
