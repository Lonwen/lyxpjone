//
//  APIUtils.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/11.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height
let STATUS_BAR_HEIGHT = UIApplication.shared.statusBarFrame.size.height
let isIphoneX =  UIApplication.shared.statusBarFrame.size.height == 44

class APIUtils: NSObject {
    
    static func jsonToDictionary(_ data : Data) {
        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any]
//        print("请求结果 \(String(describing: json))")
    }

}
