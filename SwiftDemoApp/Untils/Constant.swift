//
//  Constant.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/6.
//

import Foundation

let BASE_URL = "http://news-at.zhihu.com/api/3/"


//最新数据
let LAEST_URL = "stories/latest"
let NEW_URL = "news/latest"
//某个日期之前的数据
func NEWS_URL_BEFORE(date:String) -> String {
    return "news/before/\(date)"
}
//详情
func NEW_DETAIL_URL(id:String) -> String {
    return "news/\(id)"
}
