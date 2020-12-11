//
//  RequestLoadingPlugin.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit
import Moya
import Result

public final class RequestLoadingPlugin: PluginType {
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        var request = request
        //将token添加到请求头中
        request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        return request
    }

    public func willSend(_ request: RequestType, target: TargetType) {
        
        let requestMethod = request.request?.httpMethod
        let requestUrl = request.request?.url?.absoluteString
        let headerFields = request.request?.allHTTPHeaderFields
        let body = request.request?.httpBody
        
        print("\n============================================发送请求============================================ \n header : \(String(describing: headerFields)) \n Method : \(String(describing: requestMethod)) \n url : \(String(describing: requestUrl)) \n body: \(String(describing: body)) \n==============================================================================================")
        
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {

        
        if let response = result.value {
            print("收到数据 : \(response)")
            print("网络请求数据解析结果： \(APIUtils.jsonToDictionary(response.data))")
            switch response.statusCode {
                
            case 200 :
                print("请求数据成功")
            case 404 :
                print("接口不存在")
            default:
                print("其他错误")
            }
            
           
            
        }
        //只有出错的时候才显示
        guard case Result.failure(_) = result else {
            
            //
            return
            
        }
        
        print("网络请求错误  \(result.debugDescription)")
        
        
        
    }

}
