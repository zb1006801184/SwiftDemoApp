//
//  StringDemo.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/10/18.
//

import Foundation

class StringDemo: NSObject {
    var name:String = "zb"
    var person:NSMutableArray? {
        //set  get didSetdidSet
        //        set {
        //            print("set")
        //        }
        //        get {
        //            print("get")
        //            return [];
        //        }
        
        didSet {
            print("didSet\(String(describing: oldValue)) \(String(describing: person))")
        }
        
    }
    
    //字符串
    static  func StringDemoAction() -> Void {
        let stringLet = "stringLet"
        var stringVar = "stringVar"
        stringVar += "zz"
        print("1:\(stringLet) 2:\(stringVar) ");
    }
    //数组
    static func arryAction () -> Void {
        var names:[String] = NSMutableArray() as! [String]
        names.append("1")
        names.append("2")
        names.insert("zz", at: 1)
        names[1] = "3"
        names.remove(at: 0);
        
        //遍历数组
        for item in names {
            
        }
        //遍历数组
        for (index,item ) in names.enumerated() {
            
        }
        
        print(names);
    }
    //字典
    static func dicAction(name:String? = nil,age:Int = 2) -> Void {
       
        print("\(name ?? "v"),\(age)")
        let person = NSMutableDictionary()
        var name :[String:String] = [:]
        person.setValue("zb", forKey: "name")
        person.setValue("19", forKey: "age")
        person.setDictionary(["ag":13,"nam":"z"])
        name["s"] = "s"
        name["z"] = "b"
        //
        print("\(person),\(name),\(name["z"] ?? "1")")
    }
}
