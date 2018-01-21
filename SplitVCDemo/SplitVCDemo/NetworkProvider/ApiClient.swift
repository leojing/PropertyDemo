//
//  NetworkProvider.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire
import ObjectMapper

class ApiClient: ApiService {
    
    func fetchProperties(_ config: ApiConfig) -> Observable<[Property]> {
        let url = config.getFullURL()
        
        return Observable<[Property]>.create { observable -> Disposable in
            Alamofire.request(url)
                .responseJSON { response in
                    guard let json = response.result.value as? [String: Any] else {
                        print("Error: \(String(describing: response.result.error))")
                        observable.onError(response.result.error!)
                        observable.onCompleted()
                        return
                    }
                    guard let arrayJSON = json["data"] as? Array<[String: AnyObject]> else {
                        observable.onCompleted()
                        return
                    }
                    let properties: [Property] = Mapper<Property>().mapArray(JSONArray: arrayJSON)
                    observable.onNext(properties)
                    observable.onCompleted()
            }
            return Disposables.create()
        }.share()
    }
}

