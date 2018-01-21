//
//  SplitVCDemoTests.swift
//  SplitVCDemoTests
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import XCTest
import RxCocoa
import RxSwift
import ObjectMapper
@testable import SplitVCDemo

class SplitVCDemoTests: XCTestCase {
    
    fileprivate let disposeBag = DisposeBag()
    var viewModel: PropertyListViewModel?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testApiClient() {
        MockApiClient().fetchProperties(ApiConfig.properties)
            .subscribe(onNext: { properties in
                XCTAssertEqual(properties.first?.id!, 1)
                XCTAssertEqual(properties.first?.title!, "Property Title 1")
            }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    func testFetchPremiumArray() {
        viewModel = PropertyListViewModel(MockApiClient(), isPremium: Observable.just(true))
        
        MockApiClient().fetchPremiumProperties().subscribe(onNext: { properties in
            XCTAssertEqual(properties.first?.title, (self.viewModel?.propertyArray.value)!.first?.title)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
}

class MockApiClient: ApiService {
    
    func fetchJSONWithFileName(_ file: String) -> Observable<[Property]> {
        return Observable<[Property]>.create { observable -> Disposable in
            guard let json = JsonFileLoader.loadJson(fileName: file) as? [String: Any] else {
                observable.onNext([])
                observable.onCompleted()
                return Disposables.create()
            }
            guard let arrayJSON = json["data"] as? Array<[String: AnyObject]> else {
                observable.onCompleted()
                observable.onNext([])
                return Disposables.create()
            }
            
            let properties: [Property] = Mapper<Property>().mapArray(JSONArray: arrayJSON)
            observable.onNext(properties)
            observable.onCompleted()
            return Disposables.create()
            }.share()
    }
    
    func fetchProperties(_ config: ApiConfig) -> Observable<[Property]> {
        return fetchJSONWithFileName("MockData")
    }
    
    func fetchPremiumProperties() -> Observable<[Property]> {
        return fetchJSONWithFileName("PremiumMockData")
    }
}

class JsonFileLoader {
    
    class func loadJson(fileName: String) -> Any? {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                do {
                    return try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions(rawValue: 0))
                } catch {
                    print("Error!! Unable to parse  \(fileName).json")
                }
            }
            print("Error!! Unable to load  \(fileName).json")
        } else {
            print("invalid url")
        }
        
        return nil
    }
}

