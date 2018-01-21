//
//  ApiService.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum ApiConfig {
    case properties
}

extension ApiConfig  {
    var baseURL: String {
        return "http://demo0065087.mockable.io/test"
    }
    
    var path: String {
        switch self {
        case .properties:
            return "/properties"
        }
    }
    
    func getFullURL() -> URL {
        switch self {
        case .properties:
            return URL(string: self.baseURL+self.path)!
        }
    }
}

protocol ApiService {
    func fetchProperties(_ config: ApiConfig) -> Observable<[Property]>
}

