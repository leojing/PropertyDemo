//
//  PropertyTableviewCellModel.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 20/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import Foundation

struct PropertyDisplayModel {
    
    let profileImage: String?
    let title: String?
    let address: String?
    let suburb: String?
    let avatarImage: String?
    let owner: String?
    let bed: String?
    let bath: String?
    let carpot: String?
    
    init?(_ property: Property?) {
        guard let property = property else {
            return nil
        }
        
        profileImage = property.photo?.image?.small?.url ?? property.photo?.image?.url ?? property.photo?.image?.medium?.url ?? property.photo?.image?.large?.url ?? ""
        
        title = property.title ?? ""
        
        let addresses = [property.location?.address1 ?? "", property.location?.address2 ?? ""]
        address = addresses.joined(separator: ", ")
        
        var suburbs = [String]()
        if let postcode = property.location?.postcode {
            suburbs = [property.location?.suburb ?? "", String(describing: postcode)]
        } else {
            suburbs = [property.location?.suburb ?? ""]
        }
        suburb = suburbs.joined(separator: ", ")
        
        avatarImage = property.owner?.avatar?.small?.url ?? property.owner?.avatar?.url ?? property.owner?.avatar?.medium?.url ?? property.owner?.avatar?.large?.url ?? ""
        
        let ownerNames = [property.owner?.firstName ?? "", property.owner?.lastName ?? ""]
        owner = ownerNames.joined(separator: " ")
        
        if let beds = property.bathrooms {
            bed = "\(String(describing: beds))"
        } else {
            bed = "0"
        }
        
        if let bathes = property.bathrooms {
            bath = "\(String(describing: bathes))"
        } else {
            bath = "0"
        }
        
        if let carpots = property.carspots {
            carpot = "\(String(describing: carpots))"
        } else {
            carpot = "0"
        }
    }
}
