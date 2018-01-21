//
//	Location.swift
//
//  Created by Jing Luo on 20/1/18.
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Location : NSObject, NSCoding, Mappable{

	var address1 : String?
	var address2 : String?
	var country : String?
	var fullAddress : String?
	var id : Int?
	var latitude : Float?
	var longitude : Float?
	var postcode : String?
	var state : String?
	var suburb : String?


	class func newInstance(map: Map) -> Mappable?{
		return Location()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		address1 <- map["address_1"]
		address2 <- map["address_2"]
		country <- map["country"]
		fullAddress <- map["full_address"]
		id <- map["id"]
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		postcode <- map["postcode"]
		state <- map["state"]
		suburb <- map["suburb"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         address1 = aDecoder.decodeObject(forKey: "address_1") as? String
         address2 = aDecoder.decodeObject(forKey: "address_2") as? String
         country = aDecoder.decodeObject(forKey: "country") as? String
         fullAddress = aDecoder.decodeObject(forKey: "full_address") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         latitude = aDecoder.decodeObject(forKey: "latitude") as? Float
         longitude = aDecoder.decodeObject(forKey: "longitude") as? Float
         postcode = aDecoder.decodeObject(forKey: "postcode") as? String
         state = aDecoder.decodeObject(forKey: "state") as? String
         suburb = aDecoder.decodeObject(forKey: "suburb") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if address1 != nil{
			aCoder.encode(address1, forKey: "address_1")
		}
		if address2 != nil{
			aCoder.encode(address2, forKey: "address_2")
		}
		if country != nil{
			aCoder.encode(country, forKey: "country")
		}
		if fullAddress != nil{
			aCoder.encode(fullAddress, forKey: "full_address")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "longitude")
		}
		if postcode != nil{
			aCoder.encode(postcode, forKey: "postcode")
		}
		if state != nil{
			aCoder.encode(state, forKey: "state")
		}
		if suburb != nil{
			aCoder.encode(suburb, forKey: "suburb")
		}

	}

}
