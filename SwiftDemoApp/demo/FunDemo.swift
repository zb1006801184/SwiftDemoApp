//
//  FunDemo.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2022/3/23.
//

import Foundation

class FunDemo:NSObject {
    
    
    var num:Double {
        
        set{
            self.num = newValue
        }
        get{
            return 12.0;
        }
    }
    
    func greet(_ person: String,  day: String) -> String {
        return "Hello \(person), today is \(day)."
    }

    
    func test() -> Void {
      let a =  greet("12", day: "33")
        print(a);
        let ace = Rank.ace;
//        let aceRawValue = ace.rawValue
        print(ace);
    }
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

