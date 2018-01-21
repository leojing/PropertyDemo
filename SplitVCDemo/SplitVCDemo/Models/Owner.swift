//
//	Owner.swift
//
//  Created by Jing Luo on 20/1/18.
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Owner : NSObject, NSCoding, Mappable{

	var avatar : Avatar?
	var email : String?
	var firstName : String?
	var id : Int?
	var lastName : String?


	class func newInstance(map: Map) -> Mappable?{
		return Owner()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		avatar <- map["avatar"]
		email <- map["email"]
		firstName <- map["first_name"]
		id <- map["id"]
		lastName <- map["last_name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         avatar = aDecoder.decodeObject(forKey: "avatar") as? Avatar
         email = aDecoder.decodeObject(forKey: "email") as? String
         firstName = aDecoder.decodeObject(forKey: "first_name") as? String
         id = aDecoder.decodeObject(forKey: "id") as? Int
         lastName = aDecoder.decodeObject(forKey: "last_name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if avatar != nil{
			aCoder.encode(avatar, forKey: "avatar")
		}
		if email != nil{
			aCoder.encode(email, forKey: "email")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "first_name")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "last_name")
		}

	}

}
