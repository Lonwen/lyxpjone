//
//  APIService.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit
import Moya

enum APIService {

    case testApi
    
}

extension APIService: TargetType {
    
    var baseURL: URL {
        return URL.init(string: BASE_URL)!
    }
    


    var path: String {
        switch self {
            
        case .testApi:
            return ""
        }
        
    }
    
    var method: Moya.Method {
        switch self {
            
        case .testApi:
            return .get
        }
        
    }
    


    var sampleData: Data {
        switch self {
        default:
            return "".data(using: String.Encoding.utf8)!
        }
        
    }
    


    var task: Task {
        let params : [String : Any] = [String : Any]()
        var postEncodeMethod : Bool = false
        
        switch self {
            
        case .testApi:
           print("")
            postEncodeMethod = false

        }
        
        if self.method == .post {
            if postEncodeMethod {
                return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
            }
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }else if self.method == .get {
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
        
        return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        
    }
    


    var headers: [String : String]? {
        
        return nil
    }
    
}
