//
//  APIViewModel.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit
import Action
import RxSwift
import Moya
import RxCocoa
import NSObject_Rx

class APIViewModel: AppBaseViewModel {
    
    var requestAction : Action<Void, String>?
    
    override func setupActions() {
        
        requestAction = Action<Void, String>.init(workFactory: { () -> Observable<String> in
            
            return Observable<String>.create({ (observer) -> Disposable in
                
                self.provider?.rx.request(MultiTarget.target(APIService.testApi)).mapJSON().asObservable().subscribe(onNext: { (result) in
                    
                    let data = try? JSONSerialization.data(withJSONObject: result, options: [])
                    let jsonString = String(data: data ?? Data(), encoding: String.Encoding.utf8)
                    observer.onNext(jsonString ?? "")
                    
                }, onError: { (error) in
                    observer.onError(error)
                }, onCompleted: {
                    observer.onCompleted()
                }, onDisposed: {
                    
                }).disposed(by: self.rx.disposeBag)
                
                
                return Disposables.create {
                    
                }
            })
        })

        
    }

}
