//
//	RootClass.swift
//
//	Create by Yi Jiang on 21/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Property : NSObject, NSCoding, Mappable{

	var bathrooms : Int?
	var bedrooms : Int?
	var carspots : Int?
	var descriptionField : String?
	var id : Int?
	var isPremium : Bool?
	var location : Location?
	var owner : Owner?
	var photo : Photo?
	var price : Float?
	var state : String?
	var title : String?


	class func newInstance(map: Map) -> Mappable?{
		return Property()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		bathrooms <- map["bathrooms"]
		bedrooms <- map["bedrooms"]
		carspots <- map["carspots"]
		descriptionField <- map["description"]
		id <- map["id"]
		isPremium <- map["is_premium"]
		location <- map["location"]
		owner <- map["owner"]
		photo <- map["photo"]
		price <- map["price"]
		state <- map["state"]
		title <- map["title"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bathrooms = aDecoder.decodeObject(forKey: "bathrooms") as? Int
         bedrooms = aDecoder.decodeObject(forKey: "bedrooms") as? Int
         carspots = aDecoder.decodeObject(forKey: "carspots") as? Int
         descriptionField = aDecoder.decodeObject(forKey: "description") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         isPremium = aDecoder.decodeObject(forKey: "is_premium") as? Bool
         location = aDecoder.decodeObject(forKey: "location") as? Location
         owner = aDecoder.decodeObject(forKey: "owner") as? Owner
         photo = aDecoder.decodeObject(forKey: "photo") as? Photo
         price = aDecoder.decodeObject(forKey: "price") as? Float
         state = aDecoder.decodeObject(forKey: "state") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if bathrooms != nil{
			aCoder.encode(bathrooms, forKey: "bathrooms")
		}
		if bedrooms != nil{
			aCoder.encode(bedrooms, forKey: "bedrooms")
		}
		if carspots != nil{
			aCoder.encode(carspots, forKey: "carspots")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "description")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if isPremium != nil{
			aCoder.encode(isPremium, forKey: "is_premium")
		}
		if location != nil{
			aCoder.encode(location, forKey: "location")
		}
		if owner != nil{
			aCoder.encode(owner, forKey: "owner")
		}
		if photo != nil{
			aCoder.encode(photo, forKey: "photo")
		}
		if price != nil{
			aCoder.encode(price, forKey: "price")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}

	}

}
