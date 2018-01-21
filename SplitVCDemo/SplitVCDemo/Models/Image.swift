//
//	Image.swift
//
//  Created by Jing Luo on 20/1/18.
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Image : NSObject, NSCoding, Mappable{

	var large : Large?
	var medium : Large?
	var small : Large?
	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return Image()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		large <- map["large"]
		medium <- map["medium"]
		small <- map["small"]
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         large = aDecoder.decodeObject(forKey: "large") as? Large
         medium = aDecoder.decodeObject(forKey: "medium") as? Large
         small = aDecoder.decodeObject(forKey: "small") as? Large
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if large != nil{
			aCoder.encode(large, forKey: "large")
		}
		if medium != nil{
			aCoder.encode(medium, forKey: "medium")
		}
		if small != nil{
			aCoder.encode(small, forKey: "small")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
