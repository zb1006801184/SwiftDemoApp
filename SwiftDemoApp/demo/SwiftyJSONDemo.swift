//
//  SwiftyJSONDemo.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/19.
//

import Foundation
import SwiftyJSON

class SwiftyJSONDemo: UIViewController {
    var dataList:NSMutableArray? = NSMutableArray()
    
    // SwiftyJSON 的使用
    func requestData() -> Void {
        AlamofireHelper.get(url: LAEST_URL, parameters: nil) { (res) in
            let jsonData = JSON(res)
            let  top_stories = jsonData["top_stories"].arrayValue
            
            for item in top_stories {
                self.dataList?.add(NewsModel().initJson(jsonDta: item))
            }
            } failureHandler: { (error) in
            print(error as Any)
        }


    }

    
    
    
    
}
