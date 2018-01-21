//
//  PropertyListViewModel.swift
//  SplitVCDemo
//
//  Created by Jing Luo on 18/1/18.
//  Copyright © 2018 Jing LUO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct PropertyListViewModel {
    
    enum PropertyCount {
        case none
        case one
        case mutiple(Int)
        
        func titleForPropertyCount() -> String {
            switch self {
            case .none:
                return "No property"
                
            case .one:
                return "1 property"
                
            case .mutiple(let count):
                return "\(count) properties"
            }
        }
    }

    let disposeBag = DisposeBag()

    // Input
    fileprivate var isPremium: Observable<Bool>!

    // Output
    var propertyArray = Variable<[Property]>([])
    var propertyCount = Variable<PropertyCount>(.none)
    
    fileprivate var premiumArray = Variable<[Property]>([])
    fileprivate var allPropertyArray = Variable<[Property]>([])
    
    init(_ apiService: ApiService, isPremium: Observable<Bool>) {
        
        self.isPremium = isPremium
        fetchAllproperties(apiService)
        filterPremiumProperties()
        fetchPropertiesBy(isPremium)
        
        bindToPropertyCount()
    }
    
    // MARK: Bind isPremium to Output propertyArray, isPremium is true then show only preium properties, else show all properties
    fileprivate func fetchPropertiesBy(_ isPremium: Observable<Bool>) {
        isPremium.subscribe(onNext: { isPremium in
            if isPremium {
                self.premiumArray.asObservable().bind(to: self.propertyArray).disposed(by: self.disposeBag)
                print("is premium")
            } else {
                self.allPropertyArray.asObservable().bind(to: self.propertyArray).disposed(by: self.disposeBag)
                print("not premium")
            }
        }, onError: nil, onCompleted: nil, onDisposed: nil)
        .disposed(by: disposeBag)
    }
    
    fileprivate func fetchAllproperties(_ apiService: ApiService) {
        apiService.fetchProperties(ApiConfig.properties)
            .bind(to: allPropertyArray)
            .disposed(by: disposeBag)
    }
    
    // MARK: subscriben on allPropertyArray, once allPropertyArray changes, filter for premiumArray
    fileprivate func filterPremiumProperties() {
        allPropertyArray.asObservable()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: { properties in
                self.premiumArray.value = properties.filter{
                    guard let isPremuim = $0.isPremium else {
                        return false
                    }
                    return isPremuim
                }
            }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    // MARK: subscriben on output propertyArray, NavigationBar title changes when propertyArray's count changes
    fileprivate func bindToPropertyCount() {
        propertyArray.asObservable()
            .subscribe(onNext: { properties in
            Observable<PropertyCount>.create { observer -> Disposable in
                let count = properties.count
                switch count {
                case 0:
                    observer.onNext(PropertyCount.none)
                    observer.onCompleted()
                    
                case 1:
                    observer.onNext(PropertyCount.one)
                    observer.onCompleted()
                    
                default:
                    observer.onNext(PropertyCount.mutiple(count))
                    observer.onCompleted()
                }
                
                return Disposables.create()
                }
                .bind(to: self.propertyCount)
                .disposed(by: self.disposeBag)
        }, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    func propertyWithIndex(_ index: IndexPath) -> Property {
        return propertyArray.value[index.row]
    }
}

