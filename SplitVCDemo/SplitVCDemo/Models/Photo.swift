//
//	Photo.swift
//
//  Created by Jing Luo on 20/1/18.
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Photo : NSObject, NSCoding, Mappable{

	var defaultField : Bool?
	var id : Int?
	var image : Image?


	class func newInstance(map: Map) -> Mappable?{
		return Photo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		defaultField <- map["default"]
		id <- map["id"]
		image <- map["image"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         defaultField = aDecoder.decodeObject(forKey: "default") as? Bool
         id = aDecoder.decodeObject(forKey: "id") as? Int
         image = aDecoder.decodeObject(forKey: "image") as? Image

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if defaultField != nil{
			aCoder.encode(defaultField, forKey: "default")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}

	}

}
