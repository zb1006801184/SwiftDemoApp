//
//  mainListCell.swift
//  SwiftDemoApp
//
//  Created by zhubiao on 2021/7/5.
//

import Foundation
import UIKit
import SnapKit
class MainListCell: UITableViewCell {
    var title: UILabel!
    var desLabel: UILabel!
    var iconImage: UIImageView!
    var dataList : [String]? {
        didSet {
            self.setDataForView()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configView() -> Void {
        //标题
        title = UILabel()
        title.font = UIFont.systemFont(ofSize: 20)
        title.numberOfLines = 2
        self.contentView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.left.equalTo(10)
            make.right.equalTo(-100)
        }
        //描述
        desLabel = UILabel()
        desLabel.text = "我是描述描述"
        desLabel.textColor = UIColorFromHex(rgbValue: 0x333333)
        self.contentView.addSubview(desLabel)

        desLabel.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.left.equalTo(10)
        }
        //右侧icon
        iconImage = UIImageView()
        iconImage.backgroundColor = UIColor.red
        self.contentView.addSubview(iconImage)
        iconImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(80)
            make.right.equalTo(-20)
            make.top.equalTo(40)
        }
    }
    
    func setDataForView() -> Void {
        self.title.text = self.dataList?[0];
    }
    
}
