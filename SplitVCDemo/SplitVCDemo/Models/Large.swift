//
//	Large.swift
//
//  Created by Jing Luo on 20/1/18.
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Large : NSObject, NSCoding, Mappable{

	var url : String?


	class func newInstance(map: Map) -> Mappable?{
		return Large()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		url <- map["url"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
