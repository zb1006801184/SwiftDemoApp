//
//  NewsModel.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/19.
//

import Foundation
import SwiftyJSON
class NewsModel: NSObject {
    public var ga_prefix:String?
    public var hint:String?
    public var id:String?
    public var image:String?
    public var image_hue:String?
    public var title:String?
    public var type:String?
    public var url:String?
    
    func initJson(jsonDta:JSON) ->NewsModel {
        ga_prefix = jsonDta["ga_prefix"].stringValue
        hint = jsonDta["hint"].stringValue
        id = jsonDta["id"].stringValue
        image = jsonDta["image"].stringValue
        image_hue = jsonDta["image_hue"].stringValue
        title = jsonDta["title"].stringValue
        type = jsonDta["type"].stringValue
        url = jsonDta["url"].stringValue
        return self;
    }
    
}
