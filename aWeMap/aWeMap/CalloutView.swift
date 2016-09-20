//
//  CalloutView.swift
//  aWeMap
//
//  Created by qianfeng on 16/9/8.
//  Copyright © 2016年 SOLO. All rights reserved.
//

import UIKit

class CalloutView: UIView {

    let iconView = UIImageView()
    let nameLabel = UILabel()
    let ageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.grayColor()
        
        iconView.frame = CGRectMake(5, 5, 60, 60)
        iconView.backgroundColor = UIColor.yellowColor()
        self.addSubview(iconView)
        nameLabel.frame = CGRectMake(70, 5, 70, 20)
        nameLabel.backgroundColor = UIColor.yellowColor()
        self.addSubview(nameLabel)
        ageLabel.frame = CGRectMake(70, 30, 70, 20)
        ageLabel.backgroundColor = UIColor.yellowColor()
        self.addSubview(ageLabel)
        
    }
    
    func custom(image: UIImage, nameStr: String, ageStr: String) -> Void {
        iconView.image = image
        nameLabel.text = nameStr
        ageLabel.text = ageStr
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
