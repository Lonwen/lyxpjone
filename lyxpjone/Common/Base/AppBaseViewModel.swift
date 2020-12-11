//
//  AppBaseViewModel.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit
import Moya

typealias DataLoadFinished = () -> Void//声明

class AppBaseViewModel: NSObject {
    
    /// 超时设置
    let requestTimeoutClosure = { (endpoint: Endpoint, done: @escaping MoyaProvider<MultiTarget>.RequestResultClosure) in
        
        guard var request = try? endpoint.urlRequest() else { return }
        
        request.timeoutInterval = 120    //设置请求超时时间
        done(.success(request))
    }
    
    var provider : MoyaProvider<MultiTarget>?
    
    override init() {
        super.init()
        
        let networkActivityPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
            
            switch changeType {
            case .began:
                print("请求开始")
                DispatchQueue.main.async {
                   UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }

            case.ended:
                print("请求结束")
                DispatchQueue.main.async {
                   UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                

                
            }
            
            
            
        }
       
        /// 用模拟数据
        provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub,plugins: [RequestLoadingPlugin()])
        /// 用真实网络数据
//        provider = MoyaProvider<MultiTarget>.init(plugins: [RequestLoadingPlugin()])
        provider = MoyaProvider<MultiTarget>.init(requestClosure: requestTimeoutClosure, plugins: [RequestLoadingPlugin(),networkActivityPlugin])
        self.setupActions()
        
        
    }
    
    func setupActions()  {
        
    }

}
