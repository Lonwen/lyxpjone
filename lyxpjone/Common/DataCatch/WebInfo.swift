//
//  WebInfo.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit

class WebInfo: NSObject, NSCoding {
    
    var data : String
    var time : String
     
    //构造方法
    required  init (data: String = "", time: String = "") {
        self.data = data
        self.time = time
    }
     
    //从object解析回来
    required  init (coder decoder:  NSCoder ) {
        self.data = decoder.decodeObject(forKey:"data" ) as? String ?? ""
        self.time = decoder.decodeObject(forKey:"time" ) as? String ?? ""
    }
     
    //编码成object
    func  encode(with coder:  NSCoder ){
        coder.encode(data, forKey: "data" )
        coder.encode(time, forKey: "time" )
    }
    
    
}
